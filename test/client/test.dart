import 'package:gpodder_client/src/client.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/moor_store.dart';

Future<void> main() async {
  var dev = Device(
      id: 'gpodder_lib', caption: 'Gpodder Lib', type: DeviceType.desktop);
  GpodderClient client =
      GpodderClient<GpoPodcast>(MoorStore(), GpoPodcast.from, dev);
  await client.initialize();
  var search = await client.search(query: "méthode");
  print(search);
  var podcast = await client.loadPodcast(search[0].guidUrl);
  print(podcast);
}
