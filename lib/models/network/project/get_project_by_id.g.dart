// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_project_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectByIdRequest _$GetProjectByIdRequestFromJson(
  Map<String, dynamic> json,
) => GetProjectByIdRequest(id: json['id'] as String);

Map<String, dynamic> _$GetProjectByIdRequestToJson(
  GetProjectByIdRequest instance,
) => <String, dynamic>{'id': instance.id};

GetProjectByIdResponse _$GetProjectByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetProjectByIdResponse(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$GetProjectByIdResponseToJson(
  GetProjectByIdResponse instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
