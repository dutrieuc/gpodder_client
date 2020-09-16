import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';


part 'sub_diff.g.dart';

@JsonSerializable()
class SubscriptionDiff {
  List<Uri> add;
  List<Uri> remove;
  int timestamp;

  factory SubscriptionDiff.fromJson(Map<String, dynamic> json) => _$SubscriptionDiffFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDiffToJson(this);

  SubscriptionDiff({
    @required this.add,
    @required this.remove,
    this.timestamp,
  });

  @override
  String toString() {
    return this.toJson().toString();;
  }
}
