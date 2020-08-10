// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) {
  return Podcast(
    url: json['url'] == null ? null : Uri.parse(json['url'] as String),
    title: json['title'] as String,
    author: json['author'] as String ?? '',
    description: json['description'] as String,
    subscribers: json['subscribers'] as int,
    logo_url:
        json['logo_url'] == null ? null : Uri.parse(json['logo_url'] as String),
    website:
        json['website'] == null ? null : Uri.parse(json['website'] as String),
    mygpo_link: json['mygpo_link'] == null
        ? null
        : Uri.parse(json['mygpo_link'] as String),
    position_last_week: json['position_last_week'] as int ?? 0,
  );
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
