import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  Tag(this.title, this.tag, this.usage);

  String title;
  String tag;
  int usage;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  static List<Tag> listFromJson(Iterable<dynamic> json) =>
    List<Tag>.from(json.map((i) => Tag.fromJson(i)));

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  String toString() {
    return this.title;
  }
}