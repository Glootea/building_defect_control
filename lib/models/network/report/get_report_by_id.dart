import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_report_by_id.g.dart';
part 'get_report_by_id.freezed.dart';

@freezed
@JsonSerializable()
class GetReportByIdRequest with _$GetReportByIdRequest {
  @override
  @JsonKey(name: 'Id')
  final String id;

  const GetReportByIdRequest({required this.id});

  factory GetReportByIdRequest.fromJson(Map<String, Object?> json) =>
      _$GetReportByIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportByIdRequestToJson(this);
}

@freezed
@JsonSerializable()
class GetReportByIdResponse with _$GetReportByIdResponse {
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'SubmissionDate')
  final DateTime submissionDate;

  const GetReportByIdResponse({
    required this.name,
    required this.description,
    required this.submissionDate,
  });
  factory GetReportByIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetReportByIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetReportByIdResponseToJson(this);
}
