// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectsRequest _$GetProjectsRequestFromJson(Map<String, dynamic> json) =>
    GetProjectsRequest();

Map<String, dynamic> _$GetProjectsRequestToJson(GetProjectsRequest instance) =>
    <String, dynamic>{};

GetProjectsResponse _$GetProjectsResponseFromJson(Map<String, dynamic> json) =>
    GetProjectsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: PaginatedMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GetProjectsResponseToJson(
  GetProjectsResponse instance,
) => <String, dynamic>{'data': instance.data, 'metadata': instance.metadata};
