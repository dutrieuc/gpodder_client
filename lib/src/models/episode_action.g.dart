// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeAction _$EpisodeActionFromJson(Map<String, dynamic> json) {
  return EpisodeAction(
    episode:
        json['episode'] == null ? null : Uri.parse(json['episode'] as String),
    podcast:
        json['podcast'] == null ? null : Uri.parse(json['podcast'] as String),
    device: json['device'] as String,
    action: json['action'] == null
        ? null
        : EpisodeStatus.fromJson(json['action'] as String),
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    started: json['started'] as int,
    position: json['position'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$EpisodeActionToJson(EpisodeAction instance) =>
    <String, dynamic>{
      'episode': instance.episode?.toString(),
      'podcast': instance.podcast?.toString(),
      'device': instance.device,
      'action': instance.action,
      'timestamp': instance.timestamp?.toIso8601String(),
      'started': instance.started,
      'position': instance.position,
      'total': instance.total,
    };
