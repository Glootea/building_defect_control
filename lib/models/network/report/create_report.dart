import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_report.g.dart';
part 'create_report.freezed.dart';

@freezed
@JsonSerializable()
class CreateReportRequest with _$CreateReportRequest {
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;

  const CreateReportRequest({required this.name, required this.description});

  factory CreateReportRequest.fromJson(Map<String, Object?> json) =>
      _$CreateReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportRequestToJson(this);
}

@freezed
@JsonSerializable()
class CreateReportResponse with _$CreateReportResponse {
  @override
  @JsonKey(name: 'Id')
  final String id;

  const CreateReportResponse({required this.id});
  factory CreateReportResponse.fromJson(Map<String, Object?> json) =>
      _$CreateReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReportResponseToJson(this);
}
