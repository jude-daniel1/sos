// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_handymen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestHandymen _$RequestHandymenFromJson(Map<String, dynamic> json) {
  return RequestHandymen(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$RequestHandymenToJson(RequestHandymen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
    };
