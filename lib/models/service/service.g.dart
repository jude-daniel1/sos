// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    status: json['status'] as int,
    uploadedBy: json['uploaded_by'] as int,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'image': instance.image,
      'uploaded_by': instance.uploadedBy,
    };
