
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:meta/meta.dart';

abstract class Podcast {

  Uri guidUrl;

  Podcast(this.guidUrl);

  @override
  String toString() {
    return 'Podcast: ' + guidUrl.toString();
  }
}