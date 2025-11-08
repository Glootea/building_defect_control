import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'defect_list.state.freezed.dart';

@freezed
class DefectListPageState
    with _$DefectListPageState
    implements PaginatedResponse {
  const DefectListPageState({required this.defects, required this.metadata});

  @override
  final List<Defect> defects;
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
