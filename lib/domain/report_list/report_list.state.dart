import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_list.state.freezed.dart';

@freezed
class ReportListState with _$ReportListState implements PaginatedResponse {
  const ReportListState({
    required this.reports,
    required this.searchQuery,
    required this.metadata,
  });

  @override
  final List<Report> reports;
  @override
  final String searchQuery;
  @override
  final PaginatedMetadata metadata;

  @override
  List<Report> get data => reports;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      "ReportListPageState.toJson is not ment to be used.",
    );
  }
}
