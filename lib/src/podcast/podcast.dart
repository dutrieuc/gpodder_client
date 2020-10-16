
import 'package:gpodder_client/src/podcast/gpopodcast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable()
abstract class Podcast {

  Uri url;

  Podcast(this.url);

  @override
  String toString() {
    return 'Podcast: ' + url.toString();
  }
}