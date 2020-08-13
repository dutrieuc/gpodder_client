import '../../lib/src/api/client.dart';
import '../../lib/src/models/device.dart';

Future<void> main(List<String> arg) async {
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
  print(await client.logout());
}
