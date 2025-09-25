import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_details.g.dart';

@riverpod
class ProjectDetails extends _$ProjectDetails {
  @override
  Future<Project> build(String projectId) async {
    final dataProvider = ref.read(dataProviderProvider);
    final project = await dataProvider.getProject(projectId);
    return project;
  }

  Future<void> saveProjectName(String projectId, String newName) async {
    final dataProvider = ref.read(dataProviderProvider);
    final newProject = state.requireValue.copyWith(name: newName);

    await dataProvider.updateProject(newProject);
    state = AsyncData(newProject);
  }
}
