import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_defect.g.dart';

@JsonSerializable()
class CreateDefectRequest {
  final String name;
  final String description;
  @JsonKey(name: 'class')
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
