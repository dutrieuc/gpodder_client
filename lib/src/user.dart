import 'package:gpodder_client/src/api/wrapper.dart';
import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/models/sub_diff.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/server.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:meta/meta.dart';

class User<P extends Podcast, E extends Episode> {
  final Store<P, E> store;
  final Server server;
  final P Function(GpoPodcast) podcastFrom;
  final E Function(GpoEpisode) episodeFrom;
  final Device device;

  User(
    this.store,
    this.server,
    this.podcastFrom,
    this.episodeFrom,
    this.device,
  );

  Future<void> logout() {
    return Future.wait([
      store.close(),
      server.api.logout(),
    ]);
  }

  Future<List<P>> search({
    @required String query,
    int scale_logo = 0,
  }) async {
    var s = await server.api.search(
      query,
      scale_logo: scale_logo,
    );
    return s.map(podcastFrom).toList();
  }

  Future<List<P>> charts({
    @required int size,
    int scale_logo = 64,
  }) async {
    var s = await server.api.topPodcasts(
      size,
      scale_logo: scale_logo,
    );
    return s.map(podcastFrom).toList();
  }

  Future<P> loadPodcast(
    Uri podcast_url,
  ) async {
    var gpodcast = await server.api.podcast(podcast_url);
    return podcastFrom(gpodcast);
  }

  Future<List<P>> subscribe(List<P> podcasts) async {
    var answer = await server.api.postSubscriptionUpdate(
        device.id,
        SubscriptionDiff(
          add: podcasts.map((e) => e.url).toList(),
          remove: [],
        ));
    for (List<Uri> urls in answer.update_urls) {
      for (P p in podcasts) {
        if (p.url == urls[0]) {
          p.url = urls[1];
        }
      }
    }
    store.savePodcasts(podcasts);
    return podcasts;
  }

  Future<void> unsubscribe(List<P> podcasts) {
    return Future.wait([
      server.api.postSubscriptionUpdate(
          device.id,
          SubscriptionDiff(
            add: [],
            remove: podcasts.map((e) => e.url).toList(),
          )),
      store.deletePodcasts(podcasts.map((e) => e.url)),
    ]);
  }

  Future<void> refreshSubscription() async {
    var update = await server.api.getSubscriptionUpdate(device.id, 0);
    return Future.wait([
      store.deletePodcasts(update.remove),
      store.savePodcasts(await Future.wait(
          update.add.map((e) async => await loadPodcast(e)))),
      //TODO save timestamp
    ]);
  }

  Future<List<P>> subscriptions() async {
    return (await store.subscriptions()).toList();
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
