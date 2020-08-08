// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['title'] as String,
    json['tag'] as String,
    json['usage'] as int,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'title': instance.title,
      'tag': instance.tag,
      'usage': instance.usage,
    };
