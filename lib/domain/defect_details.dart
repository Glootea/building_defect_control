import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_details.g.dart';

@riverpod
class DefectDetails extends _$DefectDetails {
  @override
  Future<Defect> build(String defectId) async {
    final dataProvider = ref.read(dataProviderProvider);
    return dataProvider.getDefect(defectId);
  }

  Future<void> saveDefectName(String defectId, String newName) async {
    final dataProvider = ref.read(dataProviderProvider);
    final newDefect = state.requireValue.copyWith(name: newName);

    await dataProvider.updateDefect(newDefect);
    state = AsyncData(newDefect);
  }
}
