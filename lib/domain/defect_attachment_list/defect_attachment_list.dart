import 'package:control/di/di.dart';
import 'package:control/domain/defect_attachment_list/defect_attachment_list.state.dart';
import 'package:control/domain/defect_attachment_list/defect_attachment_list_query.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect_attachments/get_defect_attachments.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'defect_attachment_list.g.dart';

@riverpod
class DefectAttachmentList extends _$DefectAttachmentList {
  @override
  Future<DefectAttachmentListState> build({
    required int page,
    required DefectAttachmentListQuery query,
    required String defectId,
  }) async {
    _listenToItemUpdate(ref);

    final riverpodDebouncer = ref.read(riverpodDebouncerProvider);
    await riverpodDebouncer.start(ref);

    final defectDataProvider = ref.read(
      defectAttachmentProviderProvider(defectId),
    );
    final request = GetDefectAttachementsRequest(
      pagination: PaginationQueryParams(pageNumber: page),
    );
    final attachments = await defectDataProvider.getDefectAttachments(request);

    return DefectAttachmentListState(
      defectAttachments: attachments.data,
      metadata: attachments.metadata,
    );
  }

  Future<String?> createDefectAttachment(PlatformFile file) async {
    final defectDataProvider = ref.read(
      defectAttachmentProviderProvider(defectId),
    );

    final response = await defectDataProvider.uploadDefectAttachment(file);
    final defectAttachment = DefectAttachment(
      defectId: defectId,
      id: response.id,
      fileName: file.name,
      contentType: response.contentType,
      fileSize: response.fileSize,
      uploadDate: DateTime.now(),
    );

    ref.invalidateSelf();

    return defectAttachment.id;
  }

  void _listenToItemUpdate(Ref ref) =>
      ref.watch(defectAttachmentListUpdaterProvider);
}
