import 'dart:convert';

import 'package:control/di/di.dart';
import 'package:control/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class User extends _$User {
  late final secureStorage = ref.watch(secureStorageProvider);
  late final authService = ref.read(authServiceProvider);

  final String _userKey = 'user';

  @override
  Future<UserData?> build() async {
    final userFromStorage = await _fetchUserFromStorage();
    return userFromStorage;
  }

  Future<UserData?> _fetchUserFromStorage() async {
    final jsonString = await secureStorage.read(key: _userKey);
    final json = jsonString != null ? jsonDecode(jsonString) : null;
    return json != null ? UserData.fromJson(json) : null;
  }

  Future<void> login(String login, String password) async {
    state = const AsyncValue.loading();
    final user = await authService.login(login, password);
    if (user == null) {
      state = AsyncValue.error(
        'Invalid username or password',
        StackTrace.current,
      );

      return;
    }
    state = AsyncValue.data(user);
    final jsonString = jsonEncode(user.toJson());
    await secureStorage.write(key: _userKey, value: jsonString);
  }

  Future<void> clearUser() async {
    state = const AsyncValue.data(null);
    await secureStorage.delete(key: _userKey);
  }
}

abstract interface class IAuthService {
  Future<UserData?> login(String username, String password);
  Future<void> logout();
}

class TestingAuthService implements IAuthService {
  const TestingAuthService();

  @override
  Future<UserData?> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'admin' && password == 'admin') {
      return UserData(
        firstName: 'Admin',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.admin(),
      );
    } else if (username == 'engineer' && password == 'engineer') {
      return UserData(
        firstName: 'Engineer',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.engineer(),
      );
    } else if (username == 'manager' && password == 'manager') {
      return UserData(
        firstName: 'Manager',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.manager(),
      );
    } else if (username == 'visitor' && password == 'visitor') {
      return UserData(
        firstName: 'Visitor',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.visitor(),
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> logout() async {}
}

class AuthService implements IAuthService {
  final FlutterSecureStorage secureStorage;
  final Dio dio;
  AuthService({required this.secureStorage, required this.dio});

  @override
  Future<UserData?> login(String username, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }
}
