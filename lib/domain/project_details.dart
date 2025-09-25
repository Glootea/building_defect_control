import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_details.g.dart';

@riverpod
class ProjectDetails extends _$ProjectDetails {
  late final dataProvider = ref.read(dataProviderProvider);

  @override
  Future<Project> build(String projectId) async {
    final project = await dataProvider.getProject(projectId);
    return project;
  }

  Future<void> saveProjectName(String projectId, String newName) async {
    final newProject = state.requireValue.copyWith(name: newName);

    await dataProvider.updateProject(newProject);
    state = AsyncData(newProject);
  }
}
