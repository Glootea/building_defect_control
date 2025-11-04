import 'package:control/di/di.dart';
import 'package:control/domain/project_list/project_list.state.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_list.g.dart';

@riverpod
class ProjectList extends _$ProjectList {
  @override
  Future<ProjectListState> build(int page, String query) async {
    _listenToItemUpdate(ref);
    final projectsDataProvider = ref.read(projectDataProviderProvider);
    final request = GetProjectsRequest(
      name: query,
      pagination: PaginationQueryParams(pageNumber: page),
    );
    final projects = await projectsDataProvider.getProjects(request);

    return ProjectListState(
      projects: projects.data,
      searchQuery: query,
      metadata: projects.metadata,
    );
  }

  Future<String?> createProject(String name) async {
    final projectsDataProvider = ref.read(projectDataProviderProvider);

    final request = CreateProjectRequest(name: name);
    final response = await projectsDataProvider.createProject(request);
    final project = ProjectShallow(id: response.id, name: name);

    ref.invalidateSelf();

    return project.id;
  }

  void _listenToItemUpdate(Ref ref) => ref.watch(projectListUpdaterProvider);
}
