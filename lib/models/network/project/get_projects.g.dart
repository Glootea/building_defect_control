// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectsQueryParams _$GetProjectsQueryParamsFromJson(
  Map<String, dynamic> json,
) => GetProjectsQueryParams();

Map<String, dynamic> _$GetProjectsQueryParamsToJson(
  GetProjectsQueryParams instance,
) => <String, dynamic>{};

GetProjectsRequest _$GetProjectsRequestFromJson(Map<String, dynamic> json) =>
    GetProjectsRequest(name: json['name'] as String?);

Map<String, dynamic> _$GetProjectsRequestToJson(GetProjectsRequest instance) =>
    <String, dynamic>{'name': instance.name};

GetProjectsResponse _$GetProjectsResponseFromJson(Map<String, dynamic> json) =>
    GetProjectsResponse(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectShallow.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: PaginatedMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GetProjectsResponseToJson(
  GetProjectsResponse instance,
) => <String, dynamic>{
  'metadata': instance.metadata,
  'projects': instance.projects,
};
