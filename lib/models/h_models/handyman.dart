import 'package:json_annotation/json_annotation.dart';
import 'package:sos/models/service/service.dart';
part 'handyman.g.dart';

@JsonSerializable()
class Handyman {
  final int id;
  final String code;
  final String name;
  final String email;
  final String phone;
  final Service service;
  final String image;
  final String state;
  final String lga;
  final String address;
  final String about;
  final double latitude;
  final double longitude;
  final int status;
  final int device;
  final String token;

  Handyman(
      {required this.id,
      required this.code,
      required this.about,
      required this.device,
      required this.name,
      required this.phone,
      required this.service,
      required this.email,
      required this.image,
      required this.state,
      required this.lga,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.token});

  factory Handyman.fromJson(Map<String, dynamic> json) =>
      _$HandymanFromJson(json);
  Map<String, dynamic> toJson() => _$HandymanToJson(this);
}
