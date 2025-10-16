import 'dart:convert';

import 'package:control/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserCache {
  final FlutterSecureStorage secureStorage;

  UserCache({required this.secureStorage});

  static const String _userDataKey = 'userData';
  static const String _tokenKey = 'token';

  Future<UserData> setUser(UserData user) async {
    final serializedUser = jsonEncode(user.toJson());
    await secureStorage.write(key: _userDataKey, value: serializedUser);
    return user;
  }

  Future<void> setToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  Future<UserData?> getUser() async {
    final stored = await secureStorage.read(key: _userDataKey);
    if (stored == null) {
      return null;
    }
    final json = jsonDecode(stored);
    return UserData.fromJson(json);
  }

  Future<String?> getToken() async {
    final stored = await secureStorage.read(key: _tokenKey);
    return stored;
  }

  Future<void> clearAll() async => Future.wait([
    secureStorage.delete(key: _userDataKey),
    secureStorage.delete(key: _tokenKey),
  ]);
}
