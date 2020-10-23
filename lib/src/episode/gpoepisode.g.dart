// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpoepisode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GpoEpisode _$GpoEpisodeFromJson(Map<String, dynamic> json) {
  return GpoEpisode(
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
    status: json['status'] == null
        ? null
        : EpisodeStatus.fromJson(json['status'] as String),
    position: json['position'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$GpoEpisodeToJson(GpoEpisode instance) =>
    <String, dynamic>{
      'url': instance.url?.toString(),
      'podcast_url': instance.podcast_url?.toString(),
      'title': instance.title,
      'podcast_title': instance.podcast_title,
      'description': instance.description,
      'website': instance.website?.toString(),
      'released': instance.released?.toIso8601String(),
      'mygpo_link': instance.mygpo_link?.toString(),
      'status': instance.status,
      'position': instance.position,
      'total': instance.total,
    };
