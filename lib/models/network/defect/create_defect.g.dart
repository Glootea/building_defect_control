// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDefectRequest _$CreateDefectRequestFromJson(Map<String, dynamic> json) =>
    CreateDefectRequest(
      name: json['Name'] as String,
      description: json['Description'] as String,
      clazz: json['Class'] as String,
    );

Map<String, dynamic> _$CreateDefectRequestToJson(
  CreateDefectRequest instance,
) => <String, dynamic>{
  'Name': instance.name,
  'Description': instance.description,
  'Class': instance.clazz,
};
