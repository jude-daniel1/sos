// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    id: json['id'] as int,
    user_id: json['user_id'],
    handymen_id: json['handymen_id'],
    service_id: json['service_id'],
    status: json['status'] as String,
    date: json['date'] as String,
    progress: json['progress'] as String,
    handyman:
        RequestHandymen.fromJson(json['handyman'] as Map<String, dynamic>),
    request_for:
        RequestFor.fromJson(json['request_for'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'handymen_id': instance.handymen_id,
      'service_id': instance.service_id,
      'status': instance.status,
      'date': instance.date,
      'progress': instance.progress,
      'handyman': instance.handyman,
      'request_for': instance.request_for,
    };
