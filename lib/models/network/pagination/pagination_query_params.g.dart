// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationQueryParams _$PaginationQueryParamsFromJson(
  Map<String, dynamic> json,
) => PaginationQueryParams(
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? defaultPageSize,
);

Map<String, dynamic> _$PaginationQueryParamsToJson(
  PaginationQueryParams instance,
) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};

PaginatedRequest _$PaginatedRequestFromJson(Map<String, dynamic> json) =>
    PaginatedRequest();

Map<String, dynamic> _$PaginatedRequestToJson(PaginatedRequest instance) =>
    <String, dynamic>{};
