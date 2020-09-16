// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_diff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDiff _$SubscriptionDiffFromJson(Map<String, dynamic> json) {
  return SubscriptionDiff(
    add: (json['add'] as List)
        ?.map((e) => e == null ? null : Uri.parse(e as String))
        ?.toList(),
    remove: (json['remove'] as List)
        ?.map((e) => e == null ? null : Uri.parse(e as String))
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$SubscriptionDiffToJson(SubscriptionDiff instance) =>
    <String, dynamic>{
      'add': instance.add?.map((e) => e?.toString())?.toList(),
      'remove': instance.remove?.map((e) => e?.toString())?.toList(),
      'timestamp': instance.timestamp,
    };
