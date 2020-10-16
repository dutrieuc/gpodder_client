import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/server.dart';
import 'package:gpodder_client/src/user.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/moor_store/moor_store.dart';
import 'package:moor/ffi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() {
  User<GpoPodcast, GpoEpisode> user;
  test('login', () async {
    load();
    var dev = Device(
        id: 'gpodder_lib', caption: 'Gpodder Lib', type: DeviceType.desktop);
    var server = Server<GpoPodcast, GpoEpisode>();
    user = await server.login(
      username: env['LOGIN'],
      password: env['PASSWORD'],
      podcastFrom: GpoPodcast.from,
      episodeFrom: GpoEpisode.from,
      device: dev,
      store: MoorStore(VmDatabase.memory()),
    );
  });

  test('Podcast subscription and sync', () async {
    print(' --- search');
    var search = await user.search(query: "méthode");
    print(search);
    var podcast = await user.loadPodcast(search[0].url);
    print(podcast);
    print(' --- Loading subscriptions');
    await user.refreshSubscription();
    print(await user.subscriptions());
    print(' --- subscribing to : ' + podcast.toString());
    podcast = (await user.subscribe([podcast])).first;
    await user.refreshSubscription();
    print(await user.subscriptions());
    print(' --- unsubscribing');
    await user.unsubscribe([podcast]);
    await user.logout();
  }, timeout: Timeout(Duration(minutes: 5)));
}