// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_defect_attachments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDefectAttachmentsResponse _$GetDefectAttachmentsResponseFromJson(
  Map<String, dynamic> json,
) => GetDefectAttachmentsResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => DefectAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: PaginatedMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetDefectAttachmentsResponseToJson(
  GetDefectAttachmentsResponse instance,
) => <String, dynamic>{'metadata': instance.metadata, 'data': instance.data};
