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
  GpoPodcast podcast;
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
    var search = await user.search(query: "les idées claires");
    print(search);
    podcast = await user.loadPodcast(search[0].url);
    print(podcast);
    print(' --- Loading subscriptions');
    await user.pullSubscription();
    print(await user.subscriptions());
    print(' --- subscribing to : ' + podcast.toString());
    podcast = (await user.subscribe([podcast])).first;
    await user.pullSubscription();
    print(await user.subscriptions());
  }, timeout: Timeout(Duration(minutes: 5)));

  test('closing', () async {
    print(' --- unsubscribing');
    await user.unsubscribe([podcast]);
    print(' --- logging out');
    await user.logout();
  });
}