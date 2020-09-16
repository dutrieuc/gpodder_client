import '../../lib/src/api/client.dart';
import '../../lib/src/models/device.dart';
import '../../lib/src/models/podcast.dart';
import '../../lib/src/models/update.dart';
import '../../lib/src/models/sub_diff.dart';

Future<void> main(List<String> arg) async {
  int time = (DateTime.now().millisecondsSinceEpoch / 1000).round();
  var client = GpodderClient(username: arg[0], password: arg[1]);
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
  var podcast = await client.podcast(url);

  print("\n -- Test subscription diff");
  SubscriptionDiff newsub = SubscriptionDiff(add: [podcast.url], remove: []);
  var response = await client.postSubscriptionUpdate(dev.id, newsub);
  print(response);
  print(podcast);
  var diff = await client.getSubscriptionUpdate(dev.id, time);
  print(diff);
  newsub = SubscriptionDiff(add: [], remove: [podcast.url]);
  response = await client.postSubscriptionUpdate(dev.id, newsub);
  print(await client.logout());
}
