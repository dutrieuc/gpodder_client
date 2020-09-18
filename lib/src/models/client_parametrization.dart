import 'package:json_annotation/json_annotation.dart';

part 'client_parametrization.g.dart';

@JsonSerializable()
class ClientParametrization {
  ClientParametrization(this.mygpo, this.feedservice, this.update_timeout);

  BaseUrl mygpo;
  @JsonKey(name: 'mygpo-feedservice')
  BaseUrl feedservice;
  int update_timeout;

  factory ClientParametrization.fromJson(Map<String, dynamic> json) =>
      _$ClientParametrizationFromJson(json);

  Map<String, dynamic> toJson() => _$ClientParametrizationToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }
}

@JsonSerializable()
class BaseUrl {
  Uri baseurl;

  BaseUrl(this.baseurl);

  factory BaseUrl.fromJson(Map<String, dynamic> json) =>
      _$BaseUrlFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUrlToJson(this);

  @override
  String toString() {
    return baseurl.toString();
  }
}
