// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_defect_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDefectAttachmentResponse _$CreateDefectAttachmentResponseFromJson(
  Map<String, dynamic> json,
) => CreateDefectAttachmentResponse(
  fileName: json['fileName'] as String,
  id: json['id'] as String,
  fileSize: (json['fileSize'] as num).toInt(),
  contentType: json['contentType'] as String,
);

Map<String, dynamic> _$CreateDefectAttachmentResponseToJson(
  CreateDefectAttachmentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'fileName': instance.fileName,
  'fileSize': instance.fileSize,
  'contentType': instance.contentType,
};
