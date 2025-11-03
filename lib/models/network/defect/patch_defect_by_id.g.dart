// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_defect_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchDefectByIdRequest _$PatchDefectByIdRequestFromJson(
  Map<String, dynamic> json,
) => PatchDefectByIdRequest.__(
  name: json['name'] as String?,
  description: json['description'] as String?,
  classification: json['classification'] as String?,
  status: $enumDecodeNullable(_$DefectStatusEnumMap, json['status']),
);

Map<String, dynamic> _$PatchDefectByIdRequestToJson(
  PatchDefectByIdRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'classification': instance.classification,
  'status': _$DefectStatusEnumMap[instance.status],
};

const _$DefectStatusEnumMap = {
  DefectStatus.open: 'open',
  DefectStatus.inProgress: 'inProgress',
  DefectStatus.onReview: 'onReview',
  DefectStatus.resolved: 'resolved',
  DefectStatus.closed: 'closed',
};

PatchDefectByIdResponse _$PatchDefectByIdResponseFromJson(
  Map<String, dynamic> json,
) => PatchDefectByIdResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  clazz: json['class'] as String,
  status: $enumDecode(_$DefectStatusEnumMap, json['status']),
);

Map<String, dynamic> _$PatchDefectByIdResponseToJson(
  PatchDefectByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'class': instance.clazz,
  'status': _$DefectStatusEnumMap[instance.status]!,
};
