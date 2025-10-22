import 'package:control/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_defect_by_id.g.dart';

@JsonSerializable()
class GetDefectByIdResponse {
  final String id;
  final String name;
  final String description;
  @JsonKey(name: 'class')
  final String clazz;
  final DefectStatus status;

  const GetDefectByIdResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.clazz,
    required this.status,
  });

  factory GetDefectByIdResponse.fromJson(Map<String, Object?> json) =>
      _$GetDefectByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDefectByIdResponseToJson(this);

  Defect toDefect() {
    return Defect(
      id: id,
      name: name,
      description: description,
      classification: clazz,
      status: status,
    );
  }
}
