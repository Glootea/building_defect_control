import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_query_params.g.dart';

const int defaultPageSize = 20;

@JsonSerializable()
class PaginationQueryParams {
  final int pageNumber;
  final int pageSize;

  PaginationQueryParams({this.pageNumber = 1, this.pageSize = defaultPageSize});

  Map<String, dynamic> toJson() => _$PaginationQueryParamsToJson(this);
  factory PaginationQueryParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationQueryParamsFromJson(json);
}

@JsonSerializable()
class PaginatedRequest {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final PaginationQueryParams? pagination;

  PaginatedRequest({this.pagination});

  Map<String, dynamic> toJson() => _$PaginatedRequestToJson(this);
  factory PaginatedRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginatedRequestFromJson(json);

  Map<String, dynamic> get queryParams {
    return pagination?.toJson() ?? {};
  }
}
