import 'package:control/di/di.dart';
import 'package:control/models/models.dart' as models;
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'defect_elimination.g.dart';

@riverpod
class DefectElimination extends _$DefectElimination {
  late final dataProvider = ref.read(dataProviderProvider);

  @override
  Future<models.DefectElimination?> build(String defectId) async {
    return dataProvider.getDefectElimination(defectId);
  }

  Future<void> createDefectElimination() async {
    state = const AsyncValue.loading();
    await dataProvider.createDefectElimination(defectId);
    ref.invalidateSelf();
  }

  Future<void> updateDefect({
    DateTime? startDate,
    DateTime? endDate,
    Priority? priority,
  }) async {
    final elimination = state.requireValue;
    if (elimination == null) return;

    final updatedElimination = elimination.copyWith(
      startDate: startDate ?? elimination.startDate,
      endDate: endDate ?? elimination.endDate,
      priority: priority ?? elimination.priority,
    );
    state = AsyncValue.data(updatedElimination);
    await dataProvider.updateDefectElimination(updatedElimination);
  }

  Future<void> deleteDefectElimination() async {
    state = const AsyncValue.data(null);
    await dataProvider.deleteDefectElimination(defectId);
  }
}
