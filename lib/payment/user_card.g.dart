// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCard _$UserCardFromJson(Map<String, dynamic> json) {
  return UserCard(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    number: json['number'] as String,
    expiring: json['expiring'] as String,
    cvv: json['cvv'] as String,
  );
}

Map<String, dynamic> _$UserCardToJson(UserCard instance) => <String, dynamic>{
      'id': instance.id,
      'expiring': instance.expiring,
      'number': instance.number,
      'cvv': instance.cvv,
      'user_id': instance.userId,
    };
