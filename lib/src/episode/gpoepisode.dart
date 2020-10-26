import 'package:gpodder_client/src/models/episode_action.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/episode_status.dart';
import 'episode.dart';

part 'gpoepisode.g.dart';

@JsonSerializable()
class GpoEpisode extends Episode {
  String title;
  String podcast_title;
  String description;
  Uri website;
  DateTime released;
  Uri mygpo_link;
  EpisodeStatus status;
  int position;
  int total;

  factory GpoEpisode.fromJson(Map<String, dynamic> json) =>
      _$GpoEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$GpoEpisodeToJson(this);

  static List<GpoEpisode> listFromJson(Iterable<dynamic> json) =>
      List<GpoEpisode>.from(json.map((i) => GpoEpisode.fromJson(i)));

  GpoEpisode(
    this.title,
    Uri url,
    this.podcast_title,
    Uri podcast_url,
    this.description,
    this.website,
    this.released,
    this.mygpo_link, {
    this.status,
    this.position,
    this.total,
  }) : super(url, podcast_url);

  static GpoEpisode from(GpoEpisode gpoepisode) => gpoepisode;

  @override
  String toString() {
    return this.title;
  }

  @override
  Episode applyAction(EpisodeAction action) {
    switch (action.action) {
      case EpisodeStatus.PLAY : {
        status = status != EpisodeStatus.DOWNLOAD ? EpisodeStatus.PLAY : status;
        position = action.position ?? position;
        total = action.total ?? total;
      }
      break;
      default : {
        status = action.action;
      }
    }
    return this;
  }
}
