import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'podcast.g.dart';

@JsonSerializable()
class Podcast {
  Podcast({
    @required this.url,
    @required this.title,
    this.author = '',
    @required this.description,
    @required this.subscribers,
    @required this.logo_url,
    @required this.website,
    @required this.mygpo_link,
    this.position_last_week = 0,
  });

  Uri url;
  String title;
  @JsonKey(defaultValue: '') String author;
  String description;
  int subscribers;
  Uri logo_url;
  Uri website;
  Uri mygpo_link;
  @JsonKey(defaultValue: 0) int position_last_week;

  factory Podcast.fromJson(Map<String, dynamic> json) =>
      _$PodcastFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastToJson(this);

  static List<Podcast> listFromJson(Iterable<dynamic> json) =>
      List<Podcast>.from(json.map((i) => Podcast.fromJson(i)));

  @override
  String toString() {
    return this.title;
  }
}
