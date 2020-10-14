import 'package:gpodder_client/src/episode/gpoepisode.dart';
import 'package:gpodder_client/src/server.dart';
import 'package:gpodder_client/src/user.dart';
import 'package:gpodder_client/src/models/device.dart';
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:gpodder_client/src/store/moor_store.dart';

Future<void> main(List<String> arg) async {
  var dev = Device(
      id: 'gpodder_lib', caption: 'Gpodder Lib', type: DeviceType.desktop);
  var server = Server();
  var user = await server.login(
    username: arg[0],
    password: arg[1],
    podcastFrom: GpoPodcast.from,
    episodeFrom: GpoEpisode.from,
    device: dev,
    store: MoorStore(),
  );
  var search = await user.search(query: "méthode");
  print(search);
  var podcast = await user.loadPodcast(search[0].guidUrl);
  print(podcast);
}
