import 'package:gpodder_client/src/models/device.dart';

class UserInfo {
  final Uri host;
  final String username;
  final String password;
  final Device device;

  const UserInfo(this.host, this.username, this.password ,this.device);
}
