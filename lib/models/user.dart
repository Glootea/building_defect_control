// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@JsonSerializable()
@freezed
class UserData with _$UserData {
  @JsonKey(name: 'firstname')
  final String firstName;
  @JsonKey(name: 'middlename')
  final String middleName;
  @JsonKey(name: 'lastname')
  final String lastName;
  @JsonKey(name: 'role')
  final UserRole userRole;
  final String post;
  final String email;

  const UserData({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    this.userRole = const UserRole.admin(), // TODO: waiting on fix from backend
    required this.email,
    required this.post,
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
        case 'executor':
          return const UserRole.executor();
        case 'manager':
          return const UserRole.manager();
        case 'observer':
          return const UserRole.observer();
        case 'admin':
          return const UserRole.admin();
      }
    }
    return _$UserRoleFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);

  const UserRole.executor()
    : canReportDefects = true,
      canEliminateDefects = true,
      canManageProjects = false,
      canManageOtherUsers = false,
      canViewStatistics = false,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.executor;

  const UserRole.manager()
    : canReportDefects = true,
      canEliminateDefects = false,
      canManageProjects = true,
      canManageOtherUsers = true,
      canViewStatistics = true,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.manager;

  const UserRole.observer()
    : canReportDefects = false,
      canEliminateDefects = false,
      canManageProjects = false,
      canManageOtherUsers = false,
      canViewStatistics = true,
      isAdmin = false,
      predefinedUserRole = DefinedUserRole.observer;

  const UserRole.admin()
    : canReportDefects = true,
      canEliminateDefects = true,
      canManageProjects = true,
      canManageOtherUsers = true,
      canViewStatistics = true,
      isAdmin = true,
      predefinedUserRole = DefinedUserRole.admin;
}

enum DefinedUserRole { executor, manager, observer, admin }
