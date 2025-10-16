import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_project_by_id.g.dart';

@JsonSerializable()
class GetProjectByIdRequest {
  final String id;

  GetProjectByIdRequest({required this.id});

  Map<String, dynamic> toJson() => _$GetProjectByIdRequestToJson(this);
  factory GetProjectByIdRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectByIdRequestFromJson(json);
}

@JsonSerializable()
class GetProjectByIdResponse {
  final String id;
  final String name;

  GetProjectByIdResponse({required this.id, required this.name});
  Map<String, dynamic> toJson() => _$GetProjectByIdResponseToJson(this);
  factory GetProjectByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectByIdResponseFromJson(json);
}
