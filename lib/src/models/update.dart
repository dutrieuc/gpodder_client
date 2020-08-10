import 'package:gpodder_client/src/models/episode.dart';
import 'package:gpodder_client/src/models/podcast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'update.g.dart';

@JsonSerializable()
class Update {
  List<Podcast> add;
  List<Uri> remove;
  List<Episode> updates;
  int timestamp;

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);

  static List<Update> listFromJson(Iterable<dynamic> json) =>
      List<Update>.from(json.map((i) => Update.fromJson(i)));

  Update({
    this.add,
    this.remove,
    this.updates,
    @required this.timestamp,
  });

  @override
  String toString() {
    return this.toJson().toString();;
  }
}
