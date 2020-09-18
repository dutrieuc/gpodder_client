import '../../lib/src/api/client.dart';
import '../../lib/src/models/device.dart';
import '../../lib/src/models/podcast.dart';
import '../../lib/src/models/update.dart';
import '../../lib/src/models/sub_diff.dart';
import '../../lib/src/models/episode_action.dart';
import '../../lib/src/models/episode_status.dart';

Future<void> main(List<String> arg) async {
  int time = (DateTime.now().millisecondsSinceEpoch / 1000).round();
  var client = GpodderClient(username: arg[0], password: arg[1]);
  print(await client.getClientParametrization());
  print(await client.login());
  var dev = Device(
      id: 'gpodder_lib', caption: 'Gpodder Lib', type: DeviceType.desktop);
  var res = await client.updateDeviceData(dev);
  print(res);
  var devices = await client.listDevices();
  print(devices);
  var update = await client.getDeviceUpdate(dev, 0, include_actions: true);
  print(update);
  var url = Uri.http("radiofrance-podcast.net", "/podcast09/rss_14312.xml");
  var episode_url = Uri.parse(
      'http://rf.proxycast.org/a6411093-230d-4630-9cc0-01119fc88c70/14312-18.09.2020-ITEMA_22431127-2020C26620S0261-1779455909.mp3');

  var podcast = await client.podcast(url);

  print("\n -- Test subscription diff");
  SubscriptionDiff newsub = SubscriptionDiff(add: [podcast.url], remove: []);
  var response = await client.postSubscriptionUpdate(dev.id, newsub);
  print(response);
  print(podcast);
  var diff = await client.getSubscriptionUpdate(dev.id, time);
  print(diff);

  print("\n -- Test episode diff");
  var ep_action = EpisodeAction(
      episode: episode_url,
      podcast: url,
      device: dev.id,
      action: EpisodeStatus.PLAY);
  response = await client.postEpisodeActions([ep_action]);
  print(response);
  var ep_diff = await client.getEpisodeActions(since: time, aggregated: false);
  print(ep_diff);

  print("\n -- closing test");
  newsub = SubscriptionDiff(add: [], remove: [podcast.url]);
  response = await client.postSubscriptionUpdate(dev.id, newsub);
  print(await client.logout());
}
