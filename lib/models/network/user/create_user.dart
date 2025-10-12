import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_user.freezed.dart';
part 'create_user.g.dart';

@freezed
@JsonSerializable()
class CreateUserRequest with _$CreateUserRequest {
  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String middleName;
  @override
  final String lastName;
  @override
  final String post;
  @override
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

@freezed
@JsonSerializable()
class CreateUserResponse with _$CreateUserResponse {
  @override
  @JsonKey(name: 'Id')
  final String id;

  const CreateUserResponse({required this.id});
  factory CreateUserResponse.fromJson(Map<String, Object?> json) =>
      _$CreateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
