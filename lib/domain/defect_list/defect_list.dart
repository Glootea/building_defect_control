import 'package:control/di/di.dart';
import 'package:control/domain/defect_list/defect_list.state.dart';
import 'package:control/domain/defect_list/defect_list_query.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect/create_defect.dart';
import 'package:control/models/network/defect/get_defects_by_report_id.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_list.g.dart';

@riverpod
class DefectListScreen extends _$DefectListScreen {
  @override
  Future<DefectListPageState> build({
    required int page,
    required ReportListQueryState query,
    required String reportId,
  }) async {
    // TODO: throttle in all lists with query on query change
    _listenToItemUpdate(ref);

    final defectDataProvider = ref.read(defectDataProviderProvider(reportId));

    final request = GetDefectsByReportIdRequest(
      name: query.name.isNotEmpty ? query.name : null,
      description: query.description.isNotEmpty ? query.description : null,
      classification: query.classification.isNotEmpty
          ? query.classification
          : null,
      status: query.status,

      pagination: PaginationQueryParams(pageNumber: page),
    );
    final defects = await defectDataProvider.getDefectsByReportId(request);

    return DefectListPageState(
      defects: defects.data,
      metadata: defects.metadata,
    );
  }

  Future<String?> createDefect({
    required String name,
    required String classification,
    required String description,
  }) async {
    final defectDataProvider = ref.read(defectDataProviderProvider(reportId));

    final request = CreateDefectRequest(
      name: name,
      description: description,
      clazz: classification,
    );
    final defectResponse = await defectDataProvider.createDefect(request);
    final defect = Defect(
      id: defectResponse.id,
      name: name,
      classification: classification,
      description: description,
      status: DefectStatus.open,
    );

    ref.invalidateSelf();
    return defect.id;
  }

  void _listenToItemUpdate(Ref ref) => ref.watch(defectListUpdaterProvider);
}
