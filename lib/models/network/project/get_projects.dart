import 'package:control/models/models.dart';
import 'package:control/models/network/paginated_response/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_projects.g.dart';

@JsonSerializable()
class GetProjectsRequest {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;

  GetProjectsRequest({this.name});

  Map<String, dynamic> toJson() => _$GetProjectsRequestToJson(this);
  factory GetProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsRequestFromJson(json);
}

@JsonSerializable()
class GetProjectsResponse {
  final List<Project> data;
  final PaginatedMetadata metadata;

  GetProjectsResponse({required this.data, required this.metadata});

  Map<String, dynamic> toJson() => _$GetProjectsResponseToJson(this);

  factory GetProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsResponseFromJson(json);
}
