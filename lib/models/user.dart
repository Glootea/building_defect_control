// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@JsonSerializable()
@freezed
class UserData with _$UserData {
  final String firstName;
  final String middleName;
  final String lastName;
  final UserRole userRole;

  const UserData({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.userRole,
  });

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@freezed
@JsonSerializable()
class UserRole with _$UserRole {
  final bool canReportDefects;
  final bool canEliminateDefects;
  final bool canManageProjects;
  final bool canManageOtherUsers;
  final bool canViewStatistics;
  final bool isAdmin;
  final DefinedUserRole? predefinedUserRole;

  const UserRole({
    this.canReportDefects = false,
    this.canEliminateDefects = false,
    this.canManageProjects = false,
    this.canManageOtherUsers = false,
    this.canViewStatistics = false,
    this.isAdmin = false,
    this.predefinedUserRole,
  });

  factory UserRole.fromJson(Map<String, Object?> json) {
    if (json['predefinedUserRole'] != null) {
      final roleString = json['predefinedUserRole'] as String;
      switch (roleString) {
        case 'engineer':
          return const UserRole.engineer();
        case 'manager':
          return const UserRole.manager();
        case 'visitor':
          return const UserRole.visitor();
        case 'admin':
          return const UserRole.admin();
      }
    }
    return _$UserRoleFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);

  const UserRole.engineer()
    : canReportDefects = true,
      canEliminateDefects = true,
      canManageProjects = false,
      canManageOtherUsers = false,
      canViewStatistics = false,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.engineer;

  const UserRole.manager()
    : canReportDefects = true,
      canEliminateDefects = false,
      canManageProjects = true,
      canManageOtherUsers = true,
      canViewStatistics = true,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.manager;

  const UserRole.visitor()
    : canReportDefects = false,
      canEliminateDefects = false,
      canManageProjects = false,
      canManageOtherUsers = false,
      canViewStatistics = true,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.visitor;

  const UserRole.admin()
    : canReportDefects = true,
      canEliminateDefects = true,
      canManageProjects = true,
      canManageOtherUsers = true,
      canViewStatistics = true,
      isAdmin = true,
      predefinedUserRole = DefinedUserRole.admin;
}

enum DefinedUserRole { engineer, manager, visitor, admin }
