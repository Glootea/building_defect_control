import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_details.g.dart';

@riverpod
class DefectDetails extends _$DefectDetails {
  late final dataProvider = ref.read(dataProviderProvider);

  @override
  Future<Defect> build(String defectId) async {
    final data = await dataProvider.getDefect(defectId);
    return data;
  }

  Future<void> saveDefectName(String defectId, String newName) async {
    final newDefect = state.requireValue.copyWith(name: newName);

    await dataProvider.updateDefect(newDefect);
    state = AsyncData(newDefect);
  }

  Future<void> updateDefect(Defect newDefect) async {
    await dataProvider.updateDefect(newDefect);
    state = AsyncData(newDefect);
  }

  Future<List<String>> getExecutorsSuggestions(String query) async {
    final allUsers = await dataProvider.getExecutors();
    return allUsers
        .where(
          (user) =>
              query.isEmpty || user.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
