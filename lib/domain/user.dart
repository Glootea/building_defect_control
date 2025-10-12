import 'dart:convert';
import 'dart:developer';

import 'package:control/data/idata_provider.dart';
import 'package:control/di/di.dart';
import 'package:control/models/network/user/login_user.dart';
import 'package:control/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class User extends _$User {
  late final secureStorage = ref.watch(secureStorageProvider);
  late final authService = ref.watch(authServiceProvider);

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

    state = await AsyncValue.guard(() async {
      final user = await authService.login(login, password);
      if (user == null) {
        throw Exception('Invalid credentials');
      }

      final jsonString = jsonEncode(user.toJson());
      await secureStorage.write(key: _userKey, value: jsonString);
      return user;
    });
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

    if (username == 'admin@admin.com' && password == 'admin') {
      return UserData(
        firstName: 'Admin',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.admin(),
        email: 'admin@example.com',
        post: 'Администратор',
      );
    } else if (username == 'engineer' && password == 'engineer') {
      return UserData(
        firstName: 'Engineer',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.executor(),
        email: 'engineer@example.com',
        post: 'Engineer',
      );
    } else if (username == 'manager' && password == 'manager') {
      return UserData(
        firstName: 'Manager',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.manager(),
        email: 'manager@example.com',
        post: 'Manager',
      );
    } else if (username == 'visitor' && password == 'visitor') {
      return UserData(
        firstName: 'Visitor',
        middleName: '',
        lastName: 'User',
        userRole: const UserRole.observer(),
        email: 'visitor@example.com',
        post: 'Visitor',
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
  final IUserDataProvider userDataProvider;
  AuthService({required this.secureStorage, required this.userDataProvider});

  static const String _tokenKey = 'token';
  static const String _userDataKey = 'userData';

  @override
  Future<UserData?> login(String email, String password) async {
    final response = await userDataProvider.loginUser(
      LoginUserRequest(email: email, password: password),
    );

    final token = response.token;
    final user = response.userData;

    final serializedUser = jsonEncode(user.toJson());
    log("Received: token - $token, user - $serializedUser");

    await Future.wait([
      secureStorage.write(key: _tokenKey, value: token),
      secureStorage.write(key: _userDataKey, value: serializedUser),
    ]);

    return user;
  }

  @override
  Future<void> logout() async {
    // TODO: notify server about logout
    await Future.wait([
      secureStorage.delete(key: _tokenKey),
      secureStorage.delete(key: _userDataKey),
    ]);
  }
}
