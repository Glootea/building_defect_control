import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_defect_attachments.g.dart';

class GetDefectAttachementsRequest extends PaginatedRequest {}

class GetDefectAttachmentsQueryParams extends PaginationQueryParams {
  final String? sortBy;
  final bool? isDescending;

  GetDefectAttachmentsQueryParams({
    super.pageNumber,
    super.pageSize,
    this.sortBy,
    this.isDescending,
  });

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      if (sortBy != null) 'sortBy': sortBy,
      if (isDescending != null) 'isDescending': isDescending,
    });
}

@JsonSerializable()
class GetDefectAttachmentsResponse extends PaginatedResponse {
  @override
  // ignore: overridden_fields
  final List<DefectAttachment> data;
  GetDefectAttachmentsResponse({required this.data, required super.metadata})
    : super(data: data);

  factory GetDefectAttachmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDefectAttachmentsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetDefectAttachmentsResponseToJson(this);
}
