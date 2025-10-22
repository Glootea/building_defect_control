// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    CreateReportRequest(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateReportRequestToJson(
  CreateReportRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};

CreateReportResponse _$CreateReportResponseFromJson(
  Map<String, dynamic> json,
) => CreateReportResponse(id: json['id'] as String);

Map<String, dynamic> _$CreateReportResponseToJson(
  CreateReportResponse instance,
) => <String, dynamic>{'id': instance.id};
