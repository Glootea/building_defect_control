// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  firstName: json['firstName'] as String,
  middleName: json['middleName'] as String,
  lastName: json['lastName'] as String,
  userRole: UserRole.fromJson(json['userRole'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'middleName': instance.middleName,
  'lastName': instance.lastName,
  'userRole': instance.userRole,
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
  DefinedUserRole.engineer: 'engineer',
  DefinedUserRole.manager: 'manager',
  DefinedUserRole.visitor: 'visitor',
  DefinedUserRole.admin: 'admin',
};
