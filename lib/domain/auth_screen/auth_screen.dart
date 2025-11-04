import 'package:control/domain/user/user.dart';
import 'package:control/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_screen.g.dart';

@riverpod
class AuthScreen extends _$AuthScreen {
  late final _userProvider = ref.watch(userProvider);
  late final _userProviderNotifier = ref.watch(userProvider.notifier);

  @override
  Future<UserData?> build() async {
    return null;
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _userProviderNotifier.login(username, password);
      return _userProvider.value;
    });
  }
}
