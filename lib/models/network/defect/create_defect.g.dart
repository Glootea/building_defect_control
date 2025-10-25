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

CreateDefectResponse _$CreateDefectResponseFromJson(
  Map<String, dynamic> json,
) => CreateDefectResponse(id: json['id'] as String);

Map<String, dynamic> _$CreateDefectResponseToJson(
  CreateDefectResponse instance,
) => <String, dynamic>{'id': instance.id};
