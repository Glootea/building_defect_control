// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports_by_project_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportsByProjectIdRequest _$GetReportsByProjectIdRequestFromJson(
  Map<String, dynamic> json,
) => GetReportsByProjectIdRequest(projectId: json['ProjectId'] as String);

Map<String, dynamic> _$GetReportsByProjectIdRequestToJson(
  GetReportsByProjectIdRequest instance,
) => <String, dynamic>{'ProjectId': instance.projectId};

GetReportsByProjectIdResponse _$GetReportsByProjectIdResponseFromJson(
  Map<String, dynamic> json,
) => GetReportsByProjectIdResponse(
  id: json['Id'] as String,
  name: json['Name'] as String,
  description: json['Description'] as String,
  submissionDate: DateTime.parse(json['SubmissionDate'] as String),
);

Map<String, dynamic> _$GetReportsByProjectIdResponseToJson(
  GetReportsByProjectIdResponse instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'Description': instance.description,
  'SubmissionDate': instance.submissionDate.toIso8601String(),
};
