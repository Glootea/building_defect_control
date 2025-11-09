import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_defect_attachment.g.dart';

@JsonSerializable()
class CreateDefectAttachmentResponse {
  final String id;
  final String fileName;
  final int fileSize;
  final String contentType;

  const CreateDefectAttachmentResponse({
    required this.fileName,
    required this.id,
    required this.fileSize,
    required this.contentType,
  });

  factory CreateDefectAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDefectAttachmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDefectAttachmentResponseToJson(this);
}
