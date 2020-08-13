// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAnswer _$UploadAnswerFromJson(Map<String, dynamic> json) {
  return UploadAnswer(
    update_url: (json['update_url'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null ? null : Uri.parse(e as String))
            ?.toList())
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$UploadAnswerToJson(UploadAnswer instance) =>
    <String, dynamic>{
      'update_url': instance.update_url
          ?.map((e) => e?.map((e) => e?.toString())?.toList())
          ?.toList(),
      'timestamp': instance.timestamp,
    };
