// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportByIdRequest _$GetReportByIdRequestFromJson(
  Map<String, dynamic> json,
) => GetReportByIdRequest(id: json['id'] as String);

Map<String, dynamic> _$GetReportByIdRequestToJson(
  GetReportByIdRequest instance,
) => <String, dynamic>{'id': instance.id};

GetReportByIdResponse _$GetReportByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetReportByIdResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  submissionDate: DateTime.parse(json['submissionDate'] as String),
);

Map<String, dynamic> _$GetReportByIdResponseToJson(
  GetReportByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'submissionDate': instance.submissionDate.toIso8601String(),
};
