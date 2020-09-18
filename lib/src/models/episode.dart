import 'package:json_annotation/json_annotation.dart';

import 'episode_status.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  String title;
  Uri url;
  String podcast_title;
  Uri podcast_url;
  String description;
  Uri website;
  DateTime released;
  Uri mygpo_link;
  EpisodeStatus status;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  static List<Episode> listFromJson(Iterable<dynamic> json) =>
      List<Episode>.from(json.map((i) => Episode.fromJson(i)));

  Episode(this.title, this.url, this.podcast_title, this.podcast_url,
      this.description, this.website, this.released, this.mygpo_link,
      [this.status]);

  @override
  String toString() {
    return this.title;
  }
}
