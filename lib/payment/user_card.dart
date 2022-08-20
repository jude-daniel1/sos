import 'package:json_annotation/json_annotation.dart';
part 'user_card.g.dart';

@JsonSerializable()
class UserCard {
  final int id;
  final String expiring;
  final String number;
  final String cvv;

  @JsonKey(name: "user_id")
  int userId;

  UserCard(
      {required this.id,
      required this.userId,
      required this.number,
      required this.expiring,
      required this.cvv});

  factory UserCard.fromJson(Map<String, dynamic> json) =>
      _$UserCardFromJson(json);
  Map<String, dynamic> toJson() => _$UserCardToJson(this);
}
