import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  String id;
  String caption;
  DeviceType type;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  static List<Device> listFromJson(Iterable<dynamic> json) =>
      List<Device>.from(json.map((i) => Device.fromJson(i)));

  Device({
    this.id,
    this.caption,
    this.type,
  });

  @override
  String toString() {
    return this.caption;
  }
}

enum DeviceType { desktop, laptop, mobile, server, other }
