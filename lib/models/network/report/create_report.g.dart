// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    CreateReportRequest(
      name: json['Name'] as String,
      description: json['Description'] as String,
    );

Map<String, dynamic> _$CreateReportRequestToJson(
  CreateReportRequest instance,
) => <String, dynamic>{
  'Name': instance.name,
  'Description': instance.description,
};

CreateReportResponse _$CreateReportResponseFromJson(
  Map<String, dynamic> json,
) => CreateReportResponse(id: json['Id'] as String);

Map<String, dynamic> _$CreateReportResponseToJson(
  CreateReportResponse instance,
) => <String, dynamic>{'Id': instance.id};
