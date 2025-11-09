import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/report/patch_report.dart';
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
    final response = await reportsDataProvider.getReportById(reportId);
    return Report(
      id: response.id,
      name: response.name,
      description: response.description,
      submissionDate: response.submissionDate,
    );
  }

  late final _decouncer = ref.read(debouncerProvider);
  Future<void> updateReport(Report report) async {
    state = AsyncValue.data(report);
    _decouncer.run(() async {
      final request = PatchReportRequest(
        reportId: reportId,
        projectId: projectId,
        name: report.name,
        description: report.description,
      );
      await reportsDataProvider.patchReport(request);
    });
    ref.invalidate(defectListUpdaterProvider);
  }
}
