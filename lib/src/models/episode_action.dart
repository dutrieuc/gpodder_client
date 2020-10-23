import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'episode_status.dart';

part 'episode_action.g.dart';

@JsonSerializable()
class EpisodeAction {
  Uri episode;
  Uri podcast;
  String device;
  EpisodeStatus action;
  DateTime timestamp;
  int started;
  int position;
  int total;

  factory EpisodeAction.fromJson(Map<String, dynamic> json) =>
      _$EpisodeActionFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeActionToJson(this);

  static List<EpisodeAction> listFromJson(Iterable<dynamic> json) =>
      List<EpisodeAction>.from(json.map((i) => EpisodeAction.fromJson(i)));

  EpisodeAction({
    @required this.episode,
    @required this.podcast,
    this.device,
    @required this.action,
    this.timestamp,
    this.started,
    this.position,
    this.total,
  });

  @override
  String toString() {
    return this.episode.toString() +
        ' status:' +
        action.toString() +
        ' started, position, total: ' +
        started.toString() +
        ', ' +
        position.toString() +
        ', ' +
        total.toString();
  }
}
