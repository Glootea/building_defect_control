import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginated_response.g.dart';
part 'paginated_response.freezed.dart';

/// A generic paginated response model to be used across different endpoints.
/// Do not use directly, instead create specific models for each endpoint that utilize this structure.
@JsonSerializable()
class PaginatedResponse {
  final dynamic data;
  final PaginatedMetadata metadata;

  PaginatedResponse({required this.data, required this.metadata});

  Map<String, dynamic> toJson() => _$PaginatedResponseToJson(this);
  factory PaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedResponseFromJson(json);
}

@JsonSerializable()
@freezed
class PaginatedMetadata with _$PaginatedMetadata {
  @override
  final int currentPage;
  @override
  final int pageSize;
  @override
  final int totalCount;
  @override
  final int totalPages;
  @override
  final bool hasPrevious;
  @override
  final bool hasNext;

  PaginatedMetadata({
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
    required this.hasPrevious,
    required this.hasNext,
  });

  Map<String, dynamic> toJson() => _$PaginatedMetadataToJson(this);
  factory PaginatedMetadata.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMetadataFromJson(json);
}
