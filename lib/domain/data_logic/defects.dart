import 'package:control/di/di.dart';
import 'package:control/models/network/defect/create_defect.dart';
import 'package:control/models/network/defect/get_defect_by_id.dart';
import 'package:control/models/network/defect/get_defects_by_report_id.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defects.g.dart';

@riverpod
Future<GetDefectsByReportIdResponse> getDefects(
  Ref ref,
  int page, {
  required String reportId,
  String? name,
}) async {
  final defectDataProvider = ref.read(defectDataProviderProvider(reportId));
  final request = GetDefectsByReportIdRequest(
    name: name,
    pagination: PaginationQueryParams(pageNumber: page),
  );
  final data = defectDataProvider.getDefectsByReportId(request);
  return data;
}

@riverpod
Future<CreateDefectResponse> createDefect(
  Ref ref, {
  required String reportId,
  required String name,
  required String description,
  required String classification,
}) async {
  final defectDataProvider = ref.read(defectDataProviderProvider(reportId));

  final request = CreateDefectRequest(
    name: name,
    description: description,
    clazz: classification,
  );
  final response = await defectDataProvider.createDefect(request);

  return response;
}

@riverpod
Future<GetDefectByIdResponse> getDefectById(
  Ref ref, {
  required String reportId,
  required String defectId,
}) async {
  final defectDataProvider = ref.read(defectDataProviderProvider(reportId));
  final request = GetDefectByIdRequest(defectId: defectId);
  final response = await defectDataProvider.getDefectById(request);
  return response;
}
