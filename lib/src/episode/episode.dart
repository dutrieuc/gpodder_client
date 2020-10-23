import 'package:gpodder_client/src/models/episode_action.dart';

abstract class Episode{

  Uri url;
  Uri podcast_url;

  Episode(this.url, this.podcast_url);

  Episode applyAction(EpisodeAction action);

  @override
  String toString() {
    return 'Episode: ' + url.toString();
  }
}

