import 'package:json_annotation/json_annotation.dart';

import '../models/episode_status.dart';
import 'episode.dart';

part 'gpoepisode.g.dart';

@JsonSerializable()
class GpoEpisode extends Episode{
  String title;
  Uri url;
  String podcast_title;
  Uri podcast_url;
  String description;
  Uri website;
  DateTime released;
  Uri mygpo_link;
  EpisodeStatus status;

  factory GpoEpisode.fromJson(Map<String, dynamic> json) =>
      _$GpoEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$GpoEpisodeToJson(this);

  static List<GpoEpisode> listFromJson(Iterable<dynamic> json) =>
      List<GpoEpisode>.from(json.map((i) => GpoEpisode.fromJson(i)));

  GpoEpisode(this.title, this.url, this.podcast_title, this.podcast_url,
      this.description, this.website, this.released, this.mygpo_link,
      [this.status]);

  @override
  String toString() {
    return this.title;
  }
}
