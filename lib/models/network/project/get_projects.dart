import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_projects.g.dart';

@JsonSerializable()
class GetProjectsQueryParams {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;

  GetProjectsQueryParams({this.name});

  Map<String, dynamic> toJson() => _$GetProjectsQueryParamsToJson(this);
  factory GetProjectsQueryParams.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsQueryParamsFromJson(json);
}

@JsonSerializable()
class GetProjectsRequest extends PaginatedRequest {
  final String? name;
  GetProjectsRequest({super.pagination, this.name});

  @override
  Map<String, dynamic> toJson() => _$GetProjectsRequestToJson(this);
  factory GetProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsRequestFromJson(json);

  @override
  Map<String, dynamic> get queryParams {
    return super.queryParams
      ..addAll((name != null && name!.isNotEmpty ? {'name': name} : {}));
  }
}

@JsonSerializable()
class GetProjectsResponse extends PaginatedResponse {
  @override
  final List<ProjectShallow> data;

  GetProjectsResponse({required this.data, required super.metadata})
    : super(data: data);

  @override
  Map<String, dynamic> toJson() => _$GetProjectsResponseToJson(this);

  factory GetProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsResponseFromJson(json);
}
