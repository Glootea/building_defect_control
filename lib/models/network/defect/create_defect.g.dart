// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDefectRequest _$CreateDefectRequestFromJson(Map<String, dynamic> json) =>
    CreateDefectRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      clazz: json['class'] as String,
    );

Map<String, dynamic> _$CreateDefectRequestToJson(
  CreateDefectRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'class': instance.clazz,
};
