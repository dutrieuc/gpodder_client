
import '../models/episode_status.dart';

abstract class Episode{

  String get title;
  set title(String value);

  Uri get podcast_url;
  set podcast_url(Uri value);

  Uri get url;
  set url(Uri value);

  EpisodeStatus get status;
  set status(EpisodeStatus value);

  Uri get mygpo_link;
  set mygpo_link(Uri value);

  DateTime get released;
  set released(DateTime value);

  Uri get website;
  set website(Uri value);

  String get description;
  set description(String value);

  String get podcast_title;
  set podcast_title(String value);
}

