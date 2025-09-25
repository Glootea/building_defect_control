import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'projects.g.dart';

@riverpod
class Projects extends _$Projects {
  late final dataProvider = ref.read(dataProviderProvider);

  @override
  Future<List<ProjectShallow>> build() async {
    return dataProvider.getProjects();
  }

  Future<String> createNewProject(String name) async {
    final newProject = await dataProvider.createProject(name);

    return newProject.id;
  }
}
