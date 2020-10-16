
import 'package:gpodder_client/src/api/wrapper.dart';
import 'package:gpodder_client/src/episode/episode.dart';
import 'package:gpodder_client/src/models/client_parametrization.dart';
import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:gpodder_client/src/store/store.dart';
import 'package:gpodder_client/src/store/user_info.dart';
import 'package:meta/meta.dart';

import 'user.dart';

class Server<P extends Podcast, E extends Episode> {
  String url;
  GpodderWrapper api;
  ClientParametrization parameters;

  Server({this.url = 'https://gpodder.net', this.parameters, username, password}){
    api = GpodderWrapper(host: url, username: username, password: password);
  }

  Future<void> initialize() async {
    var now = DateTime.now().millisecondsSinceEpoch / 1000;
    if (parameters == null ||
        parameters.timestamp + parameters.update_timeout > now ) {
      parameters = await api.getClientParametrization();
      //TODO store parameters
    }
  }

  Future<User<P, E>> login({
    username,
    password,
    @required podcastFrom,
    @required episodeFrom,
    @required device,
    @required Store<P, E> store,
  }) async {
    await initialize();
    if (username != null && password != null) {
      api = GpodderWrapper(
        host: parameters.mygpo.toString(),
        username: username,
        password: password,
      );
      store.putUserInfo(UserInfo(url, username, password, device));
    }
    try {
      await api.login();
      var user = User(store, this, podcastFrom, episodeFrom, device);
      return user;
    } catch (e) {
      store.deleteUser();
      return e;
    }
  }
}