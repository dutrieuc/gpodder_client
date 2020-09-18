import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'episode_action.dart';

part 'ep_diff.g.dart';

@JsonSerializable()
class EpisodeDiff {
  List<EpisodeAction> actions;
  int timestamp;

  factory EpisodeDiff.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDiffFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDiffToJson(this);

  EpisodeDiff({
    @required this.actions,
    this.timestamp,
  });

  @override
  String toString() {
    return this.toJson().toString();
    ;
  }
}
