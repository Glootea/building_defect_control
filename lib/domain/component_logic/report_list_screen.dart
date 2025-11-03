import 'package:control/data/data_cache/reports.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'report_list_screen.freezed.dart';
part 'report_list_screen.g.dart';

@freezed
class ReportListPageState
    with _$ReportListPageState
    implements PaginatedResponse {
  const ReportListPageState({
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

@riverpod
class ReportListScreen extends _$ReportListScreen {
  @override
  Future<ReportListPageState> build(
    String projectId,
    int page,
    String query,
  ) async {
    final lastState = state;
    final reports = await ref.watch(
      getReportsByProjectIdProvider(projectId, page, name: query).future,
    );
    return ReportListPageState(
      reports: reports.data,
      searchQuery: lastState.value?.searchQuery ?? '',
      metadata: reports.metadata,
    );
  }

  Future<String?> createReport(String name, String description) async {
    final currentState = state.value;
    CreateReportResponse? reportResponse;
    state = await AsyncValue.guard(() async {
      reportResponse = await ref.watch(
        createReportProvider(projectId, name, description).future,
      );
      final report = Report(
        id: reportResponse!.id,
        name: name,
        description: description,
        submissionDate: DateTime.now(),
      );
      if (currentState == null) {
        return ReportListPageState(
          reports: [report],
          searchQuery: '',
          metadata:
              currentState?.metadata ??
              PaginatedMetadata(
                currentPage: 1,
                pageSize: 1,
                totalCount: 1,
                totalPages: 1,
                hasPrevious: false,
                hasNext: false,
              ),
        );
      }
      final updatedReports = [report, ...currentState.reports];
      final currentMetadata = currentState.metadata;
      return ReportListPageState(
        reports: updatedReports,
        searchQuery: currentState.searchQuery,
        metadata: currentMetadata.copyWith(
          totalCount: currentMetadata.totalCount + 1,
          pageSize: currentMetadata.pageSize + 1,
        ),
      );
    });

    return reportResponse?.id;
  }
}
