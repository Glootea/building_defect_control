import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_defect.g.dart';
part 'create_defect.freezed.dart';

@freezed
@JsonSerializable()
class CreateDefectRequest with _$CreateDefectRequest {
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'Class')
  final String clazz;

  const CreateDefectRequest({
    required this.name,
    required this.description,
    required this.clazz,
  });

  factory CreateDefectRequest.fromJson(Map<String, Object?> json) =>
      _$CreateDefectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDefectRequestToJson(this);
}
