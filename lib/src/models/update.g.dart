// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    add: (json['add'] as List)
        ?.map((e) =>
            e == null ? null : Podcast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remove: (json['remove'] as List)
        ?.map((e) => e == null ? null : Uri.parse(e as String))
        ?.toList(),
    updates: (json['updates'] as List)
        ?.map((e) =>
            e == null ? null : Episode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'add': instance.add,
      'remove': instance.remove?.map((e) => e?.toString())?.toList(),
      'updates': instance.updates,
      'timestamp': instance.timestamp,
    };
