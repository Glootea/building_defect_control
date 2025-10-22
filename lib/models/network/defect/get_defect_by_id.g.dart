// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_defect_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDefectByIdResponse _$GetDefectByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetDefectByIdResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  clazz: json['class'] as String,
  status: $enumDecode(_$DefectStatusEnumMap, json['status']),
);

Map<String, dynamic> _$GetDefectByIdResponseToJson(
  GetDefectByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'class': instance.clazz,
  'status': _$DefectStatusEnumMap[instance.status]!,
};

const _$DefectStatusEnumMap = {
  DefectStatus.open: 'open',
  DefectStatus.inProgress: 'inProgress',
  DefectStatus.onReview: 'onReview',
  DefectStatus.resolved: 'resolved',
  DefectStatus.closed: 'closed',
};
