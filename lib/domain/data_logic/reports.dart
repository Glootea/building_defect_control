import 'package:control/di/di.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:control/models/network/report/get_report_by_id.dart';
import 'package:control/models/network/report/get_reports_by_project_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'reports.g.dart';

@riverpod
Future<GetReportByIdResponse> getReportById(
  Ref ref,
  String projectId,
  String reportId,
) async {
  final reportsDataProvider = ref.watch(reportDataProviderProvider(projectId));
  final response = await reportsDataProvider.getReportById(reportId);
  return response;
}

@riverpod
Future<GetReportsByProjectIdResponse> getReportsByProjectId(
  Ref ref,
  String projectId,
  int page, {
  String? name,
}) async {
  final reportsDataProvider = ref.watch(reportDataProviderProvider(projectId));
  final request = GetReportsByProjectIdRequest(
    pagination: PaginationQueryParams(pageNumber: page),
    projectId: projectId,
    name: name,
  );
  final response = await reportsDataProvider.getReportByProjectId(request);
  return response;
}

@riverpod
Future<CreateReportResponse> createReport(
  Ref ref,
  String projectId,
  String name,
  String description,
) async {
  final reportsDataProvider = ref.watch(reportDataProviderProvider(projectId));
  final request = CreateReportRequest(name: name, description: description);
  final response = await reportsDataProvider.createReport(request);
  return response;
}
