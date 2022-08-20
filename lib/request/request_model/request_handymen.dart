import 'package:json_annotation/json_annotation.dart';
part 'request_handymen.g.dart';

@JsonSerializable()
class RequestHandymen {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;

  RequestHandymen(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image});

  factory RequestHandymen.fromJson(Map<String, dynamic> json) =>
      _$RequestHandymenFromJson(json);
  Map<String, dynamic> toJson() => _$RequestHandymenToJson(this);
}
