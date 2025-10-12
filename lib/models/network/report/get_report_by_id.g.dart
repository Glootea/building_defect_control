// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportByIdRequest _$GetReportByIdRequestFromJson(
  Map<String, dynamic> json,
) => GetReportByIdRequest(id: json['Id'] as String);

Map<String, dynamic> _$GetReportByIdRequestToJson(
  GetReportByIdRequest instance,
) => <String, dynamic>{'Id': instance.id};

GetReportByIdResponse _$GetReportByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetReportByIdResponse(
  name: json['name'] as String,
  description: json['description'] as String,
  submissionDate: DateTime.parse(json['SubmissionDate'] as String),
);

Map<String, dynamic> _$GetReportByIdResponseToJson(
  GetReportByIdResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'SubmissionDate': instance.submissionDate.toIso8601String(),
};
