import 'package:test/test.dart';
import '../../src/api/client.dart';

Future<void> main(List<String> arg) async {
  var client = GpodderClient(username: arg[0], password: arg[1]);
  print( await client.login());
  print( await client.logout());
}
