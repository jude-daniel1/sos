// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handyman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Handyman _$HandymanFromJson(Map<String, dynamic> json) {
  return Handyman(
    id: json['id'] as int,
    code: json['code'] as String,
    about: json['about'] as String,
    device: json['device'] as int,
    name: json['name'] as String,
    phone: json['phone'] as String,
    service: Service.fromJson(json['service'] as Map<String, dynamic>),
    email: json['email'] as String,
    image: json['image'] as String,
    state: json['state'] as String,
    lga: json['lga'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    status: json['status'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$HandymanToJson(Handyman instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'service': instance.service,
      'image': instance.image,
      'state': instance.state,
      'lga': instance.lga,
      'address': instance.address,
      'about': instance.about,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'device': instance.device,
      'token': instance.token,
    };
