import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/project/patch_project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_details.g.dart';

@riverpod
class ProjectDetails extends _$ProjectDetails {
  late final projectDataProvider = ref.watch(projectDataProviderProvider);

  @override
  Future<ProjectShallow> build({required String projectId}) async {
    final response = await projectDataProvider.getProjectById(projectId);
    return ProjectShallow(id: response.id, name: response.name);
  }

  late final _decouncer = ref.read(debouncerProvider);
  Future<void> updateProject(ProjectShallow project) async {
    state = AsyncValue.data(project);
    _decouncer.run(() async {
      final request = PatchProjectRequest(
        projectId: projectId,
        name: project.name,
      );
      await projectDataProvider.patchProject(request);
    });
    ref.invalidate(projectListUpdaterProvider);
  }
}
