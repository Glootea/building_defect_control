// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_defects_by_report_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDefectsByReportIdResponse _$GetDefectsByReportIdResponseFromJson(
  Map<String, dynamic> json,
) => GetDefectsByReportIdResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => Defect.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: PaginatedMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetDefectsByReportIdResponseToJson(
  GetDefectsByReportIdResponse instance,
) => <String, dynamic>{'metadata': instance.metadata, 'data': instance.data};
