// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAnswer _$UploadAnswerFromJson(Map<String, dynamic> json) {
  return UploadAnswer(
    update_urls: (json['update_urls'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null ? null : Uri.parse(e as String))
            ?.toList())
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$UploadAnswerToJson(UploadAnswer instance) =>
    <String, dynamic>{
      'update_urls': instance.update_urls
          ?.map((e) => e?.map((e) => e?.toString())?.toList())
          ?.toList(),
      'timestamp': instance.timestamp,
    };
