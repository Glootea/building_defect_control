import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect/get_defect_by_id.dart';
import 'package:control/models/network/defect/patch_defect_by_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_details.g.dart';

@riverpod
class DefectDetails extends _$DefectDetails {
  late final dataProvider = ref.read(defectDataProviderProvider(defectId));

  @override
  Future<Defect> build({
    required String defectId,
    required String reportId,
  }) async {
    final defectDataProvider = ref.read(defectDataProviderProvider(reportId));
    final request = GetDefectByIdRequest(defectId: defectId);
    final response = await defectDataProvider.getDefectById(request);
    return response.toDefect();
  }

  Future<void> updateDefect(Defect defect) async {
    state = AsyncValue.data(defect);
    final request = PatchDefectByIdRequest(
      reportId: reportId,
      defectId: defectId,
      name: defect.name,
      description: defect.description,
      classification: defect.classification,
      status: defect.status,
    );
    await dataProvider.patchDefect(request);
    ref.invalidate(defectListUpdaterProvider);
  }
}
