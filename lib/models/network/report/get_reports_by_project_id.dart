// ignore_for_file: overridden_fields

import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_reports_by_project_id.g.dart';

@JsonSerializable()
class GetReportsByProjectIdRequest extends PaginatedRequest {
  final String projectId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? description;

  const GetReportsByProjectIdRequest({
    required this.projectId,
    this.name,
    this.description,
    super.pagination,
  });

  factory GetReportsByProjectIdRequest.fromJson(Map<String, Object?> json) =>
      _$GetReportsByProjectIdRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetReportsByProjectIdRequestToJson(this);

  @override
  Map<String, dynamic> get queryParams => super.queryParams
    ..addAll({
      if (name != null && name!.isNotEmpty) 'name': name,
      if (description != null && description!.isNotEmpty)
        'description': description,
    });
}

@JsonSerializable()
class GetReportsByProjectIdResponse extends PaginatedResponse {
  @override
  final List<Report> data;

  const GetReportsByProjectIdResponse({
    required this.data,
    required super.metadata,
  }) : super(data: data);

  factory GetReportsByProjectIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetReportsByProjectIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetReportsByProjectIdResponseToJson(this);
}
