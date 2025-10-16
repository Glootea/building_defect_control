import 'package:control/domain/network.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
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
  final dio = ref.read(dioClientProvider);
  final request = GetProjectsRequest(
    pagination: PaginationQueryParams(pageNumber: page),
  );
  final response = await dio.get(
    "api/projects",
    queryParameters: request.queryParams,
  );
  final data = GetProjectsResponse.fromJson(response.data);
  return data;
}

@riverpod
Future<ProjectShallow> createProject(Ref ref, String name) async {
  final dio = ref.read(dioClientProvider);

  final response = await dio.post(
    "/api/projects",
    data: CreateProjectRequest(name: name).toJson(),
  );
  final request = CreateProjectResponse.fromJson(response.data);
  return ProjectShallow(id: request.id, name: name);
}

@riverpod
Future<GetProjectsResponse> testingGetProjects(
  Ref ref,
  int page, {
  String? name,
}) async {
  final pageSize = 20;
  final totalCount = 100;
  return GetProjectsResponse(
    data: List.generate(
      pageSize,
      (index) =>
          ProjectShallow(id: index.toString(), name: 'Test Project ${index}'),
    ),
    metadata: PaginatedMetadata(
      currentPage: page,
      pageSize: pageSize,
      totalCount: totalCount,
      totalPages: (totalCount / pageSize).ceil(),
      hasPrevious: page > 1,
      hasNext: page < (totalCount / pageSize).ceil(),
    ),
  );
}
