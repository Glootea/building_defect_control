import 'package:freezed_annotation/freezed_annotation.dart';
part 'patch_project.g.dart';

@JsonSerializable(constructor: '_')
class PatchProjectRequest {
  final String name;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String projectId;

  const PatchProjectRequest({required this.name, required this.projectId});
  factory PatchProjectRequest._(String name) {
    return PatchProjectRequest(name: name, projectId: '');
  }

  factory PatchProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchProjectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PatchProjectRequestToJson(this);
}

@JsonSerializable()
class PatchProjectResponse {
  final String id;
  final String name;

  const PatchProjectResponse({required this.id, required this.name});

  factory PatchProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PatchProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatchProjectResponseToJson(this);
}
