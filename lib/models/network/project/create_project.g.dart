// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProjectRequest _$CreateProjectRequestFromJson(
  Map<String, dynamic> json,
) => CreateProjectRequest(name: json['name'] as String);

Map<String, dynamic> _$CreateProjectRequestToJson(
  CreateProjectRequest instance,
) => <String, dynamic>{'name': instance.name};

CreateProjectResponse _$CreateProjectResponseFromJson(
  Map<String, dynamic> json,
) => CreateProjectResponse(id: json['id'] as String);

Map<String, dynamic> _$CreateProjectResponseToJson(
  CreateProjectResponse instance,
) => <String, dynamic>{'id': instance.id};
