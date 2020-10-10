import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'gpopodcast.g.dart';

@JsonSerializable()
class GpoPodcast extends Podcast{
  GpoPodcast({
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

  factory GpoPodcast.fromJson(Map<String, dynamic> json) =>
      _$GpoPodcastFromJson(json);

  Map<String, dynamic> toJson() => _$GpoPodcastToJson(this);

  static List<GpoPodcast> listFromJson(Iterable<dynamic> json) =>
      List<GpoPodcast>.from(json.map((i) => GpoPodcast.fromJson(i)));


  @override
  String toString() {
    return this.title;
  }
}
