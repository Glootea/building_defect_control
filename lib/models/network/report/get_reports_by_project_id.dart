import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_reports_by_project_id.g.dart';

@JsonSerializable()
class GetReportsByProjectIdRequest {
  @JsonKey(name: 'ProjectId')
  final String projectId;

  const GetReportsByProjectIdRequest({required this.projectId});

  factory GetReportsByProjectIdRequest.fromJson(Map<String, Object?> json) =>
      _$GetReportsByProjectIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportsByProjectIdRequestToJson(this);
}

@JsonSerializable()
class GetReportsByProjectIdResponse {
  @JsonKey(name: 'Id')
  final String id;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Description')
  final String description;
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
