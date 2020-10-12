import 'package:gpodder_client/src/api/wrapper.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/models/sub_diff.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:gpodder_client/src/store/user.dart';
import 'package:meta/meta.dart';

class GpodderClient<P extends Podcast> {
  final Store store;
  final P Function(GpoPodcast) cast;
  final Device device;
  GpodderWrapper mygpo;
  ClientParametrization parameters;
  String host;

  bool _loggedIn = false;

  GpodderClient(
    this.store,
    this.cast,
    this.device, {
    this.host = 'https://gpodder.net',
  });

  Future<bool> initialize() async {
    var now = DateTime.now().millisecondsSinceEpoch / 1000;
    User user = await store.getUser();
    host = user.host ?? host;
    mygpo = GpodderWrapper(host: host);
    parameters = await store.getClientParameters();
    if (parameters == null ||
        parameters.timestamp + parameters.update_timeout > now ||
        user == User.noUserAvailable) {
      parameters = await mygpo.getClientParametrization();
    }
    mygpo = GpodderWrapper(
      host: parameters.mygpo.toString(),
      username: user.username,
      password: user.password,
    );
    if (user == User.noUserAvailable) return false;
    return login();
  }

  Future<bool> login({
    username,
    password,
  }) async {
    if (username != null && password != null) {
      mygpo = GpodderWrapper(
        host: parameters.mygpo.toString(),
        username: username,
        password: password,
      );
      store.putUser(User(Uri.parse(host), username, password));
    }
    return mygpo
        .login()
        .then((value) => _loggedIn = value == 200)
        .catchError((e) {
      _loggedIn = false;
      store.deleteUser();
      return e;
    });
  }

  Future<void> logout() {
    return Future.wait([
      store.deleteUser(),
      mygpo.logout(),
    ]);
  }

  Future<List<P>> search({
    @required String query,
    int scale_logo = 0,
  }) async {
    var s = await mygpo.search(
      query,
      scale_logo: scale_logo,
    );
    return s.map(cast).toList();
  }

  Future<List<P>> charts({
    @required int size,
    int scale_logo = 64,
  }) async {
    var s = await mygpo.topPodcasts(
      size,
      scale_logo: scale_logo,
    );
    return s.map(cast).toList();
  }

  Future<P> loadPodcast(
    Uri podcast_url,
  ) async {
    var gpodcast = await mygpo.podcast(podcast_url);
    return cast(gpodcast);
  }

  Future<List<P>> subscribe(List<P> podcasts) async {
    var answer = await mygpo.postSubscriptionUpdate(
        device.id,
        SubscriptionDiff(
          add: podcasts.map((e) => e.guidUrl),
          remove: [],
        ));
    for (List<Uri> urls in answer.update_urls) {
      for (P p in podcasts) {
        if (p.guidUrl == urls[0]) {
          p.guidUrl = urls[1];
        }
      }
    }
    store.savePodcasts(podcasts);
    return podcasts;
  }

  Future<void> unsubscribe(List<P> podcasts) {
    return Future.wait([
      mygpo.postSubscriptionUpdate(
          device.id,
          SubscriptionDiff(
            add: [],
            remove: podcasts.map((e) => e.guidUrl),
          )),
      store.deletePodcasts(podcasts),
    ]);
  }

  Future<void> setDownloaded(Episode episode) {
    throw UnsupportedError;
  }

  Future<void> setCompletion(
    Episode episode,
    int position,
  ) {
    throw UnsupportedError;
  }

  Future<void> toggleEpisodePlayed(Episode episode) {
    throw UnsupportedError;
  }
}
