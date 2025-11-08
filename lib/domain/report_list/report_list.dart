import 'package:control/di/di.dart';
import 'package:control/domain/report_list/report_list.state.dart';
import 'package:control/domain/report_list/report_list_query.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:control/models/network/report/get_reports_by_project_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_list.g.dart';

@riverpod
class ReportList extends _$ReportList {
  late final reportsDataProvider = ref.watch(
    reportDataProviderProvider(projectId),
  );
  @override
  Future<ReportListState> build(
    String projectId,
    int page,
    ReportListQueryState query,
  ) async {
    _listenToItemUpdate(ref);
    final lastState = state;

    final request = GetReportsByProjectIdRequest(
      pagination: PaginationQueryParams(pageNumber: page),
      projectId: projectId,
      name: query.name,
      description: query.description,
    );
    final response = await reportsDataProvider.getReportByProjectId(request);
    return ReportListState(
      reports: response.data,
      searchQuery: lastState.value?.searchQuery ?? '',
      metadata: response.metadata,
    );
  }

  Future<String?> createReport(String name, String description) async {
    final request = CreateReportRequest(name: name, description: description);
    final reportResponse = await reportsDataProvider.createReport(request);
    ref.invalidateSelf();

    return reportResponse.id;
  }

  void _listenToItemUpdate(Ref ref) => ref.watch(reportListUpdaterProvider);
}
