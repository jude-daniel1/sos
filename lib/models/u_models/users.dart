import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String state;
  final String lga;
  final String address;
  final double latitude;
  final double longitude;
  final int status;
  final String token;

  Users(
      {required this.id,
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
      required this.token});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
