// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode(
    json['title'] as String,
    json['url'] == null ? null : Uri.parse(json['url'] as String),
    json['podcast_title'] as String,
    json['podcast_url'] == null
        ? null
        : Uri.parse(json['podcast_url'] as String),
    json['description'] as String,
    json['website'] == null ? null : Uri.parse(json['website'] as String),
    json['released'] == null
        ? null
        : DateTime.parse(json['released'] as String),
    json['mygpo_link'] == null ? null : Uri.parse(json['mygpo_link'] as String),
  );
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url?.toString(),
      'podcast_title': instance.podcast_title,
      'podcast_url': instance.podcast_url?.toString(),
      'description': instance.description,
      'website': instance.website?.toString(),
      'released': instance.released?.toIso8601String(),
      'mygpo_link': instance.mygpo_link?.toString(),
    };
