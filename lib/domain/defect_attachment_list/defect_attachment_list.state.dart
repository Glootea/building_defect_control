import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'defect_attachment_list.state.freezed.dart';

@freezed
class DefectAttachmentListState
    with _$DefectAttachmentListState
    implements PaginatedResponse {
  const DefectAttachmentListState({
    required this.defectAttachments,

    required this.metadata,
  });

  @override
  final List<DefectAttachment> defectAttachments;

  @override
  final PaginatedMetadata metadata;

  @override
  List<DefectAttachment> get data => defectAttachments;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      "DefectAttachmentListState.toJson is not ment to be used.",
    );
  }
}
