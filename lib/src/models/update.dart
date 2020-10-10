import '../episode/gpoepisode.dart';
import '../podcast/gpopodcast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class Update {
  List<GpoPodcast> add;
  List<Uri> remove;
  List<GpoEpisode> updates;
  int timestamp;

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);

  Update({
    this.add,
    this.remove,
    this.updates,
    this.timestamp,
  });

  @override
  String toString() {
    return this.toJson().toString();;
  }
}
