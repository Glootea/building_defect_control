import 'package:control/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'patch_defect_by_id.g.dart';

@JsonSerializable(constructor: '__')
class PatchDefectByIdRequest {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String reportId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String defectId;

  final String? name;
  final String? description;
  final String? classification;
  final DefectStatus? status;

  const PatchDefectByIdRequest({
    this.name,
    this.description,
    this.classification,
    this.status,
    required this.reportId,
    required this.defectId,
  });

  factory PatchDefectByIdRequest.__({
    String? name,
    String? description,
    String? classification,
    DefectStatus? status,
  }) {
    return PatchDefectByIdRequest(
      name: name,
      description: description,
      classification: classification,
      status: status,
      reportId: '',
      defectId: '',
    );
  }

  Map<String, dynamic> toJson() => _$PatchDefectByIdRequestToJson(this);
}

@JsonSerializable()
class PatchDefectByIdResponse {
  final String id;
  final String name;
  final String description;
  @JsonKey(name: 'class')
  final String clazz;
  final DefectStatus status;

  const PatchDefectByIdResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.clazz,
    required this.status,
  });

  factory PatchDefectByIdResponse.fromJson(Map<String, Object?> json) =>
      _$PatchDefectByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatchDefectByIdResponseToJson(this);
}
