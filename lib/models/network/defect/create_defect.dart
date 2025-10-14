import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_defect.g.dart';

@JsonSerializable()
class CreateDefectRequest {
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Description')
  final String description;
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
