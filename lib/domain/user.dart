import 'package:control/di/di.dart';
import 'package:control/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class User extends _$User {
  late final userCache = ref.watch(userCacheProvider);
  late final userDataProvider = ref.watch(userDataProviderProvider);

  @override
  Future<UserData?> build() async {
    final cachedUser = await getCachedUser();
    return cachedUser;
  }

  Future<UserData?> getCachedUser() async {
    final storedUser = await userCache.getUser();

    return storedUser;
  }

  Future<UserData> login(String login, String password) async {
    state = await AsyncValue.guard(() async {
      final (user, token) = await userDataProvider.loginUser(login, password);
      await Future.wait([userCache.setUser(user), userCache.setToken(token)]);

      return user;
    });
    if (state.hasError) {
      final error = state.error!;
      state = AsyncValue.data(null);
      throw error;
    }

    return state.value!;
  }

  Future<void> clearUser() async {
    state = const AsyncValue.data(null);
    await userCache.clearAll();
  }
}
