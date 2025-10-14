import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_report.g.dart';

@JsonSerializable()
class CreateReportRequest {
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Description')
  final String description;

  const CreateReportRequest({required this.name, required this.description});

  factory CreateReportRequest.fromJson(Map<String, Object?> json) =>
      _$CreateReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportRequestToJson(this);
}

@JsonSerializable()
class CreateReportResponse {
  @JsonKey(name: 'Id')
  final String id;

  const CreateReportResponse({required this.id});
  factory CreateReportResponse.fromJson(Map<String, Object?> json) =>
      _$CreateReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReportResponseToJson(this);
}
