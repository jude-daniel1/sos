import 'package:json_annotation/json_annotation.dart';
import 'package:sos/request/request_model/request_for.dart';
import 'package:sos/request/request_model/request_handymen.dart';
part 'request.g.dart';

@JsonSerializable()
class Request {
  final int id;
  final user_id;
  final handymen_id;
  final service_id;
  final String status;
  final String date;
  final String progress;
  final RequestHandymen handyman;
  final RequestFor request_for;

  Request(
      {required this.id,
      required this.user_id,
      required this.handymen_id,
      required this.service_id,
      required this.status,
      required this.date,
      required this.progress,
      required this.handyman,
      required this.request_for});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
