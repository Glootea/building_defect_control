import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_reports_by_project_id.g.dart';
part 'get_reports_by_project_id.freezed.dart';

@freezed
@JsonSerializable()
class GetReportsByProjectIdRequest with _$GetReportsByProjectIdRequest {
  @override
  @JsonKey(name: 'ProjectId')
  final String projectId;

  const GetReportsByProjectIdRequest({required this.projectId});

  factory GetReportsByProjectIdRequest.fromJson(Map<String, Object?> json) =>
      _$GetReportsByProjectIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportsByProjectIdRequestToJson(this);
}

@freezed
@JsonSerializable()
class GetReportsByProjectIdResponse with _$GetReportsByProjectIdResponse {
  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'SubmissionDate')
  final DateTime submissionDate;

  const GetReportsByProjectIdResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.submissionDate,
  });

  factory GetReportsByProjectIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetReportsByProjectIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportsByProjectIdResponseToJson(this);
}
