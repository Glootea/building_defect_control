import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_details.g.dart';

@riverpod
class DefectDetails extends _$DefectDetails {
  late final dataProvider = ref.read(dataProviderProvider);

  @override
  Future<Defect> build(String defectId) async {
    return dataProvider.getDefect(defectId);
  }

  Future<void> saveDefectName(String defectId, String newName) async {
    final newDefect = state.requireValue.copyWith(name: newName);

    await dataProvider.updateDefect(newDefect);
    state = AsyncData(newDefect);
  }
}
