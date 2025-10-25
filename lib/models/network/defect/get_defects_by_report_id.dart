// ignore_for_file: overridden_fields

import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_defects_by_report_id.g.dart';

@JsonSerializable()
class GetDefectsByReportIdRequest extends PaginatedRequest {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? description;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? classification;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DefectStatus? status;

  const GetDefectsByReportIdRequest({
    this.name,
    this.description,
    this.classification,
    this.status,
    super.pagination,
  });

  factory GetDefectsByReportIdRequest.fromJson(Map<String, Object?> json) =>
      _$GetDefectsByReportIdRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetDefectsByReportIdRequestToJson(this);

  @override
  Map<String, dynamic> get queryParams => super.queryParams
    ..addAll({
      if (name != null && name!.isNotEmpty) 'name': name,
      if (description != null && description!.isNotEmpty)
        'description': description,
      if (classification != null && classification!.isNotEmpty)
        'class': classification,
      if (status != null) 'status': status!.name,
    });
}

@JsonSerializable()
class GetDefectsByReportIdResponse extends PaginatedResponse {
  @override
  final List<Defect> data;

  GetDefectsByReportIdResponse({required this.data, required super.metadata})
    : super(data: data);

  factory GetDefectsByReportIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetDefectsByReportIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetDefectsByReportIdResponseToJson(this);
}
