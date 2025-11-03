import 'package:control/di/di.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'projects.g.dart';

@riverpod
Future<GetProjectsResponse> getProjects(
  Ref ref,
  int page, {
  String? name,
}) async {
  final projectsDataProvider = ref.read(projectDataProviderProvider);
  final request = GetProjectsRequest(
    name: name,
    pagination: PaginationQueryParams(pageNumber: page),
  );
  final data = projectsDataProvider.getProjects(request);
  return data;
}

@riverpod
Future<ProjectShallow> createProject(Ref ref, String name) async {
  final projectsDataProvider = ref.read(projectDataProviderProvider);

  final request = CreateProjectRequest(name: name);
  final response = await projectsDataProvider.createProject(request);

  return ProjectShallow(id: response.id, name: name);
}

@riverpod
Future<ProjectShallow> getProjectById(Ref ref, String projectId) async {
  final projectsDataProvider = ref.read(projectDataProviderProvider);
  final response = await projectsDataProvider.getProjectById(projectId);
  return ProjectShallow(id: response.id, name: response.name);
}
