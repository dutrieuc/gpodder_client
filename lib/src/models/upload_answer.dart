import 'package:gpodder_client/src/models/episode.dart';
import 'package:gpodder_client/src/models/podcast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'upload_answer.g.dart';

@JsonSerializable()
class UploadAnswer {
  List<List<Uri>> update_url;
  int timestamp;

  factory UploadAnswer.fromJson(Map<String, dynamic> json) => _$UploadAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAnswerToJson(this);

  UploadAnswer({
    @required this.update_url,
    @required this.timestamp,
  });

  @override
  String toString() {
    return this.toJson().toString();;
  }
}
