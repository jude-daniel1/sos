import 'package:json_annotation/json_annotation.dart';

part 'only_handymen.g.dart';

@JsonSerializable()
class OnlyHandymen {
  final int id;
  final String code;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String state;
  final String lga;
  final String address;
  final String about;
  final double latitude;
  final double longitude;
  final int status;
  final double distance;

  OnlyHandymen(
      {required this.id,
      required this.code,
      required this.about,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.state,
      required this.lga,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.distance});

  factory OnlyHandymen.fromJson(Map<String, dynamic> json) =>
      _$OnlyHandymenFromJson(json);
  Map<String, dynamic> toJson() => _$OnlyHandymenToJson(this);
}
