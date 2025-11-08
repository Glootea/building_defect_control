import 'package:freezed_annotation/freezed_annotation.dart';
part 'patch_report.g.dart';

@JsonSerializable(constructor: '_')
class PatchReportRequest {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String projectId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String reportId;
  final String name;
  final String description;

  const PatchReportRequest({
    required this.name,
    required this.description,
    required this.reportId,
    required this.projectId,
  });
  factory PatchReportRequest._(String name, String description) {
    return PatchReportRequest(
      name: name,
      description: description,
      reportId: '',
      projectId: '',
    );
  }

  factory PatchReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PatchReportRequestToJson(this);
}

@JsonSerializable()
class PatchReportResponse {
  final String id;
  final String projectId;
  final String name;
  final String description;
  final DateTime submissionDate;

  const PatchReportResponse({
    required this.id,
    required this.projectId,
    required this.name,
    required this.description,
    required this.submissionDate,
  });

  factory PatchReportResponse.fromJson(Map<String, dynamic> json) =>
      _$PatchReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatchReportResponseToJson(this);
}
