// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchProjectRequest _$PatchProjectRequestFromJson(Map<String, dynamic> json) =>
    PatchProjectRequest._(json['name'] as String);

Map<String, dynamic> _$PatchProjectRequestToJson(
  PatchProjectRequest instance,
) => <String, dynamic>{'name': instance.name};

PatchProjectResponse _$PatchProjectResponseFromJson(
  Map<String, dynamic> json,
) => PatchProjectResponse(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$PatchProjectResponseToJson(
  PatchProjectResponse instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
