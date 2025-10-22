// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserRequest _$LoginUserRequestFromJson(Map<String, dynamic> json) =>
    LoginUserRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginUserRequestToJson(LoginUserRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(
      token: json['accessToken'] as String,
      userData: UserData.fromJson(json['userdata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.token,
      'userdata': instance.userData,
    };
