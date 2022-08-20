// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'only_handymen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlyHandymen _$OnlyHandymenFromJson(Map<String, dynamic> json) {
  return OnlyHandymen(
    id: json['id'] as int,
    code: json['code'] as String,
    about: json['about'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    image: json['image'] as String,
    state: json['state'] as String,
    lga: json['lga'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    status: json['status'] as int,
    distance: (json['distance'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OnlyHandymenToJson(OnlyHandymen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'state': instance.state,
      'lga': instance.lga,
      'address': instance.address,
      'about': instance.about,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'distance': instance.distance,
    };
