import 'package:json_annotation/json_annotation.dart';
part 'service.g.dart';

@JsonSerializable()
class Service {
  final int id;
  final String title;
  final String description;
  final int status;
  final String image;

  @JsonKey(name: "uploaded_by")
  int uploadedBy;

  Service(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.uploadedBy,
      required this.image});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
