import 'package:json_annotation/json_annotation.dart';
part 'request_for.g.dart';

@JsonSerializable()
class RequestFor {
  final int id;
  final String title;
  final String image;

  RequestFor({required this.id, required this.title, required this.image});

  factory RequestFor.fromJson(Map<String, dynamic> json) =>
      _$RequestForFromJson(json);
  Map<String, dynamic> toJson() => _$RequestForToJson(this);
}
