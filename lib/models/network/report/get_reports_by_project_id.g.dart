// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports_by_project_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportsByProjectIdRequest _$GetReportsByProjectIdRequestFromJson(
  Map<String, dynamic> json,
) => GetReportsByProjectIdRequest(projectId: json['projectId'] as String);

Map<String, dynamic> _$GetReportsByProjectIdRequestToJson(
  GetReportsByProjectIdRequest instance,
) => <String, dynamic>{'projectId': instance.projectId};

GetReportsByProjectIdResponse _$GetReportsByProjectIdResponseFromJson(
  Map<String, dynamic> json,
) => GetReportsByProjectIdResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => Report.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: PaginatedMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetReportsByProjectIdResponseToJson(
  GetReportsByProjectIdResponse instance,
) => <String, dynamic>{'metadata': instance.metadata, 'data': instance.data};
