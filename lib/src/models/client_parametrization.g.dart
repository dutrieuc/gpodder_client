// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_parametrization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientParametrization _$ClientParametrizationFromJson(
    Map<String, dynamic> json) {
  return ClientParametrization(
    json['mygpo'] == null
        ? null
        : BaseUrl.fromJson(json['mygpo'] as Map<String, dynamic>),
    json['mygpo-feedservice'] == null
        ? null
        : BaseUrl.fromJson(json['mygpo-feedservice'] as Map<String, dynamic>),
    json['update_timeout'] as int,
  );
}

Map<String, dynamic> _$ClientParametrizationToJson(
        ClientParametrization instance) =>
    <String, dynamic>{
      'mygpo': instance.mygpo,
      'mygpo-feedservice': instance.feedservice,
      'update_timeout': instance.update_timeout,
    };

BaseUrl _$BaseUrlFromJson(Map<String, dynamic> json) {
  return BaseUrl(
    json['baseurl'] == null ? null : Uri.parse(json['baseurl'] as String),
  );
}

Map<String, dynamic> _$BaseUrlToJson(BaseUrl instance) => <String, dynamic>{
      'baseurl': instance.baseurl?.toString(),
    };
