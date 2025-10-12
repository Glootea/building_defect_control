import 'package:control/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user.freezed.dart';
part 'login_user.g.dart';

@freezed
@JsonSerializable()
class LoginUserRequest with _$LoginUserRequest {
  @override
  final String email;
  @override
  final String password;

  const LoginUserRequest({required this.email, required this.password});

  factory LoginUserRequest.fromJson(Map<String, Object?> json) =>
      _$LoginUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserRequestToJson(this);
}

@freezed
@JsonSerializable()
class LoginUserResponse with _$LoginUserResponse {
  @override
  final String token;
  @override
  @JsonKey(name: 'userdata')
  final UserData userData;

  const LoginUserResponse({required this.token, required this.userData});

  factory LoginUserResponse.fromJson(Map<String, Object?> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}
