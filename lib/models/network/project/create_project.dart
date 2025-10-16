import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_project.g.dart';

@JsonSerializable()
class CreateProjectRequest {
  final String name;

  CreateProjectRequest({required this.name});

  Map<String, dynamic> toJson() => _$CreateProjectRequestToJson(this);
  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
}

@JsonSerializable()
class CreateProjectResponse {
  final String id;

  CreateProjectResponse({required this.id});

  Map<String, dynamic> toJson() => _$CreateProjectResponseToJson(this);
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}
