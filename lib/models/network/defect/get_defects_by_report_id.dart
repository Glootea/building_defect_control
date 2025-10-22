import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_defects_by_report_id.g.dart';

@JsonSerializable()
class GetDefectsByReportIdResponse extends PaginatedResponse {
  GetDefectsByReportIdResponse({required this.data, required super.metadata})
    : super(data: data);

  @override
  final List<Defect> data;
  factory GetDefectsByReportIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetDefectsByReportIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetDefectsByReportIdResponseToJson(this);
}
