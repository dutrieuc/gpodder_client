// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ep_diff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDiff _$EpisodeDiffFromJson(Map<String, dynamic> json) {
  return EpisodeDiff(
    actions: (json['actions'] as List)
        ?.map((e) => e == null
            ? null
            : EpisodeAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$EpisodeDiffToJson(EpisodeDiff instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      'timestamp': instance.timestamp,
    };
