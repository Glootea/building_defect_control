// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  firstName: json['firstname'] as String,
  middleName: json['middlename'] as String,
  lastName: json['lastname'] as String,
  userRole: json['role'] == null
      ? const UserRole.admin()
      : UserRole.fromJson(json['role'] as Map<String, dynamic>),
  email: json['email'] as String,
  post: json['post'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'firstname': instance.firstName,
  'middlename': instance.middleName,
  'lastname': instance.lastName,
  'role': instance.userRole,
  'post': instance.post,
  'email': instance.email,
};

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole(
  canReportDefects: json['canReportDefects'] as bool? ?? false,
  canEliminateDefects: json['canEliminateDefects'] as bool? ?? false,
  canManageProjects: json['canManageProjects'] as bool? ?? false,
  canManageOtherUsers: json['canManageOtherUsers'] as bool? ?? false,
  canViewStatistics: json['canViewStatistics'] as bool? ?? false,
  isAdmin: json['isAdmin'] as bool? ?? false,
  predefinedUserRole: $enumDecodeNullable(
    _$DefinedUserRoleEnumMap,
    json['predefinedUserRole'],
  ),
);

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
  'canReportDefects': instance.canReportDefects,
  'canEliminateDefects': instance.canEliminateDefects,
  'canManageProjects': instance.canManageProjects,
  'canManageOtherUsers': instance.canManageOtherUsers,
  'canViewStatistics': instance.canViewStatistics,
  'isAdmin': instance.isAdmin,
  'predefinedUserRole': _$DefinedUserRoleEnumMap[instance.predefinedUserRole],
};

const _$DefinedUserRoleEnumMap = {
  DefinedUserRole.executor: 'executor',
  DefinedUserRole.manager: 'manager',
  DefinedUserRole.observer: 'observer',
  DefinedUserRole.admin: 'admin',
};
