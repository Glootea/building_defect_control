// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(User)
const userProvider = UserProvider._();

final class UserProvider extends $AsyncNotifierProvider<User, UserData?> {
  const UserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userHash();

  @$internal
  @override
  User create() => User();
}

String _$userHash() => r'b1180e3bfb00cc87246bf89716d7863abd350697';

abstract class _$User extends $AsyncNotifier<UserData?> {
  FutureOr<UserData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserData?>, UserData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserData?>, UserData?>,
              AsyncValue<UserData?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
