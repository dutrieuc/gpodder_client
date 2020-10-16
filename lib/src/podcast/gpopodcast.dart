import 'package:gpodder_client/src/podcast/podcast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'gpopodcast.g.dart';

@JsonSerializable()
class GpoPodcast extends Podcast {
  GpoPodcast({
    @required Uri url,
    this.title,
    this.author = '',
    this.description,
    this.subscribers,
    this.logo_url,
    this.website,
    this.mygpo_link,
    this.position_last_week = 0,
  }) : super(url);

  String title;
  @JsonKey(defaultValue: '')
  String author;
  String description;
  int subscribers;
  Uri logo_url;
  Uri website;
  Uri mygpo_link;
  @JsonKey(defaultValue: 0)
  int position_last_week;

  factory GpoPodcast.fromJson(Map<String, dynamic> json) =>
      _$GpoPodcastFromJson(json);

  Map<String, dynamic> toJson() => _$GpoPodcastToJson(this);

  static List<GpoPodcast> listFromJson(Iterable<dynamic> json) =>
      List<GpoPodcast>.from(json.map((i) => GpoPodcast.fromJson(i)));

  static GpoPodcast from(GpoPodcast gpodcast){
    return gpodcast;
  }

  @override
  String toString() {
    return this.title;
  }
}
