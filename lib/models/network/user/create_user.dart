import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String email;
  final String password;
  final String firstName;
  final String middleName;
  final String lastName;
  final String post;
  final String roleName;

  const CreateUserRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.post,
    required this.roleName,
  });

  factory CreateUserRequest.fromJson(Map<String, Object?> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

@JsonSerializable()
class CreateUserResponse {
  @JsonKey(name: 'Id')
  final String id;

  const CreateUserResponse({required this.id});
  factory CreateUserResponse.fromJson(Map<String, Object?> json) =>
      _$CreateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
