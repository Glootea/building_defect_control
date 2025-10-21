import 'package:control/domain/data_logic/projects.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_list_screen.freezed.dart';
part 'project_list_screen.g.dart';

@freezed
class ProjectListPageState
    with _$ProjectListPageState
    implements PaginatedResponse {
  const ProjectListPageState({
    required this.projects,
    required this.searchQuery,
    required this.metadata,
  });

  @override
  final List<ProjectShallow> projects;
  @override
  final String searchQuery;
  @override
  final PaginatedMetadata metadata;

  @override
  List<ProjectShallow> get data => projects;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      "ProjectListPageState.toJson is not ment to be used.",
    );
  }
}

@riverpod
class ProjectListScreen extends _$ProjectListScreen {
  @override
  Future<ProjectListPageState> build(int page, String query) async {
    final lastState = state;
    final projects = await ref.watch(
      getProjectsProvider(page, name: query).future,
    );
    return ProjectListPageState(
      projects: projects.data,
      searchQuery: lastState.value?.searchQuery ?? '',
      metadata: projects.metadata,
    );
  }

  Future<String?> createProject(String name) async {
    final currentState = state.value;
    ProjectShallow? project;
    state = await AsyncValue.guard(() async {
      project = await ref.watch(createProjectProvider(name).future);
      if (currentState == null) {
        return ProjectListPageState(
          projects: [project!],
          searchQuery: '',
          metadata:
              currentState?.metadata ??
              PaginatedMetadata(
                currentPage: 1,
                pageSize: 1,
                totalCount: 1,
                totalPages: 1,
                hasPrevious: false,
                hasNext: false,
              ),
        );
      }
      final updatedProjects = [project!, ...currentState.projects];
      final currentMetadata = currentState.metadata;
      return ProjectListPageState(
        projects: updatedProjects,
        searchQuery: currentState.searchQuery,
        metadata: currentMetadata.copyWith(
          totalCount: currentMetadata.totalCount + 1,
          pageSize: currentMetadata.pageSize + 1,
        ),
      );
    });

    return project?.id;
  }
}
