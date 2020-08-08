// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) {
  return Podcast(
    json['url'] == null ? null : Uri.parse(json['url'] as String),
    json['title'] as String,
    json['author'] as String,
    json['description'] as String,
    json['subscribers'] as int,
    json['logo_url'] == null ? null : Uri.parse(json['logo_url'] as String),
    json['website'] == null ? null : Uri.parse(json['website'] as String),
    json['mygpo_link'] == null ? null : Uri.parse(json['mygpo_link'] as String),
  )..position_last_week = json['position_last_week'] as int;
}

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'url': instance.url?.toString(),
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'subscribers': instance.subscribers,
      'logo_url': instance.logo_url?.toString(),
      'website': instance.website?.toString(),
      'mygpo_link': instance.mygpo_link?.toString(),
      'position_last_week': instance.position_last_week,
    };
