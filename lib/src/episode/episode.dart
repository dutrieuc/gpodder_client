
import '../models/episode_status.dart';

abstract class Episode{

  Uri guidUrl;

  Episode(this.guidUrl);

  @override
  String toString() {
    return 'Episode: ' + guidUrl.toString();
  }
}

