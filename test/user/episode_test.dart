import 'dart:math';

import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/models/episode_action.dart';
import 'package:gpodder_client/src/models/episode_status.dart';
import 'package:gpodder_client/src/server.dart';
import 'package:gpodder_client/src/user.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/moor_store/moor_store.dart';
import 'package:moor/ffi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dotenv/dotenv.dart' show load, env;
@Timeout(const Duration(seconds: 60))
void main() {
  User<GpoPodcast, GpoEpisode> user;
  GpoPodcast podcast;
  GpoEpisode first;
  var since = (DateTime.now().millisecondsSinceEpoch / 1000).round();
  var episodes;

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
  }, timeout: Timeout(Duration(minutes: 1)));

  test('loadind feed, storing episodes', () async {
    print(' --- loading feed');
    await user.pullSubscription();
    podcast = (await user.subscriptions()).values.first;
    print(podcast);
    episodes = await user.loadEpisodes([podcast]);
    print(episodes);
    first = episodes.first.first;
    print(first.toJson());
  }, timeout: Timeout(Duration(minutes: 5)));

  test('send downloaded status', () async {
    print(' --- download');
    first = await user.setDownloaded(first);
    first = await user.store.findEpisodeByGuid(first.url.toString());
    print(first.toJson());
  });

  test('send played status', () async {
    print(' --- play');
    print(first.toJson());
    var total = first.total;
    var position = Random().nextInt(total);
    first = await user.setCompletion(first, position, total);
    print(first.toJson());
    first = await user.store.findEpisodeByGuid(first.url.toString());
    print(first.toJson());
  });

  test('read new episode actions', () async {
    print(' --- sync episode actions');
    first.applyAction(EpisodeAction(
      episode: first.url,
      podcast: first.podcast_url,
      action: EpisodeStatus.NEW,
    ));
    print(first.toJson());
    print(await user.pullEpisodeActions());
    print(first.toJson());
  });

  test('closing', () async {
    print(' --- logging out');
    await user.logout();
  });
}
