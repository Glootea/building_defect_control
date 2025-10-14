import 'package:control/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user.g.dart';

@JsonSerializable()
class LoginUserRequest {
  final String email;
  final String password;

  const LoginUserRequest({required this.email, required this.password});

  factory LoginUserRequest.fromJson(Map<String, Object?> json) =>
      _$LoginUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserRequestToJson(this);
}

@JsonSerializable()
class LoginUserResponse {
  final String token;
  @JsonKey(name: 'userdata')
  final UserData userData;

  const LoginUserResponse({required this.token, required this.userData});

  factory LoginUserResponse.fromJson(Map<String, Object?> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}
