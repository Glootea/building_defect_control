import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'report_details.g.dart';

@riverpod
class ReportDetails extends _$ReportDetails {
  late final reportsDataProvider = ref.watch(
    reportDataProviderProvider(projectId),
  );

  @override
  Future<Report> build({
    required String projectId,
    required String reportId,
  }) async {
    state = const AsyncLoading();
    final response = await reportsDataProvider.getReportById(reportId);
    print('report details loaded: $response');
    return Report(
      id: response.id,
      name: response.name,
      description: response.description,
      submissionDate: response.submissionDate,
    );
  }

  Future<void> updateReport(Report report) async {
    // TODO: Implement update report logic
    ref.invalidate(defectListUpdaterProvider);
  }
}
