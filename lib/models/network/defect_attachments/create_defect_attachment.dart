import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_defect_attachment.g.dart';

class CreateDefectAttachmentRequest {
  final String file;

  const CreateDefectAttachmentRequest({required this.file});
}

@JsonSerializable()
class CreateDefectAttachmentResponse {
  final String fileName;

  const CreateDefectAttachmentResponse({required this.fileName});

  factory CreateDefectAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDefectAttachmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDefectAttachmentResponseToJson(this);
}
