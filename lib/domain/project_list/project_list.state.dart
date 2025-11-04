import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'project_list.state.freezed.dart';

@freezed
class ProjectListState with _$ProjectListState implements PaginatedResponse {
  const ProjectListState({
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
