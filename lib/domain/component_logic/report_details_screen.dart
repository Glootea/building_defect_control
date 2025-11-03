import 'package:control/data/data_cache/defects.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'report_details_screen.freezed.dart';
part 'report_details_screen.g.dart';

@freezed
class DefectListPageState
    with _$DefectListPageState
    implements PaginatedResponse {
  const DefectListPageState({
    required this.defects,
    required this.searchQuery,
    required this.metadata,
  });

  @override
  final List<Defect> defects;
  @override
  final String searchQuery;
  @override
  final PaginatedMetadata metadata;

  @override
  List<Defect> get data => defects;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      "DefectListPageState.toJson is not ment to be used.",
    );
  }
}

@riverpod
class DefectListScreen extends _$DefectListScreen {
  @override
  Future<DefectListPageState> build({
    required int page,
    required String query,
    required String reportId,
  }) async {
    final lastState = state;
    final defects = await ref.watch(
      getDefectsProvider(reportId: reportId, page, name: query).future,
    );
    return DefectListPageState(
      defects: defects.data,
      searchQuery: lastState.value?.searchQuery ?? '',
      metadata: defects.metadata,
    );
  }

  Future<String?> createDefect({
    required String name,
    required String classification,
    required String description,
  }) async {
    final currentState = state.value;
    Defect? defect;
    state = await AsyncValue.guard(() async {
      final defectResponse = await ref.watch(
        createDefectProvider(
          name: name,
          classification: classification,
          description: description,
          reportId: reportId,
        ).future,
      );
      defect = Defect(
        id: defectResponse.id,
        name: name,
        classification: classification,
        description: description,
        status: DefectStatus.open,
      );
      if (currentState == null) {
        return DefectListPageState(
          defects: [defect!],
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
      final updatedDefects = [defect!, ...currentState.defects];
      final currentMetadata = currentState.metadata;
      return DefectListPageState(
        defects: updatedDefects,
        searchQuery: currentState.searchQuery,
        metadata: currentMetadata.copyWith(
          totalCount: currentMetadata.totalCount + 1,
          pageSize: currentMetadata.pageSize + 1,
        ),
      );
    });

    return defect?.id;
  }
}
