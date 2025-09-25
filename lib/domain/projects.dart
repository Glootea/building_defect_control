import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'projects.g.dart';

@riverpod
class Projects extends _$Projects {
  @override
  Future<List<ProjectShallow>> build() async {
    final dataProvider = ref.read(dataProviderProvider);
    return dataProvider.getProjects();
  }

  Future<String> createNewProject(String name) async {
    final dataProvider = ref.read(dataProviderProvider);

    final newProject = await dataProvider.createProject(name);

    return newProject.id;
  }
}
