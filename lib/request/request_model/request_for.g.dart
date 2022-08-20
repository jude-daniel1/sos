// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_for.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestFor _$RequestForFromJson(Map<String, dynamic> json) {
  return RequestFor(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$RequestForToJson(RequestFor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
