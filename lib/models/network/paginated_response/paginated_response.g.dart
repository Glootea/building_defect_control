// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse _$PaginatedResponseFromJson(Map<String, dynamic> json) =>
    PaginatedResponse(
      data: json['data'],
      metadata: PaginatedMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PaginatedResponseToJson(PaginatedResponse instance) =>
    <String, dynamic>{'data': instance.data, 'metadata': instance.metadata};

PaginatedMetadata _$PaginatedMetadataFromJson(Map<String, dynamic> json) =>
    PaginatedMetadata(
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasPrevious: json['hasPrevious'] as bool,
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$PaginatedMetadataToJson(PaginatedMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasPrevious': instance.hasPrevious,
      'hasNext': instance.hasNext,
    };
