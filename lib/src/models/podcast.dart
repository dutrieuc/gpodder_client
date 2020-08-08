import 'package:json_annotation/json_annotation.dart';

part 'podcast.g.dart';

@JsonSerializable()
class Podcast {

  Podcast(this.url, this.title, this.author, this.description, this.subscribers,
      this.logo_url, this.website, this.mygpo_link);

  Uri url;
  String title;
  String author;
  String description;
  int subscribers;
  Uri logo_url;
  Uri website;
  Uri mygpo_link;
  int position_last_week;

  factory Podcast.fromJson(Map<String, dynamic> json) => _$PodcastFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastToJson(this);

  static List<Podcast> listFromJson(Iterable<dynamic> json) =>
      List<Podcast>.from(json.map((i) => Podcast.fromJson(i)));

  @override
  String toString() {
    return this.title;
  }

}