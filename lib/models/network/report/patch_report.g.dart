// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchReportRequest _$PatchReportRequestFromJson(Map<String, dynamic> json) =>
    PatchReportRequest._(json['name'] as String, json['description'] as String);

Map<String, dynamic> _$PatchReportRequestToJson(PatchReportRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

PatchReportResponse _$PatchReportResponseFromJson(Map<String, dynamic> json) =>
    PatchReportResponse(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      submissionDate: DateTime.parse(json['submissionDate'] as String),
    );

Map<String, dynamic> _$PatchReportResponseToJson(
  PatchReportResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'name': instance.name,
  'description': instance.description,
  'submissionDate': instance.submissionDate.toIso8601String(),
};
