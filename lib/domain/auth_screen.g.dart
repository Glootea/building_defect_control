// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthScreen)
const authScreenProvider = AuthScreenProvider._();

final class AuthScreenProvider
    extends $AsyncNotifierProvider<AuthScreen, UserData?> {
  const AuthScreenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authScreenHash();

  @$internal
  @override
  AuthScreen create() => AuthScreen();
}

String _$authScreenHash() => r'c9d928ebef3cc42154dfa5c4b15f1e9b47061630';

abstract class _$AuthScreen extends $AsyncNotifier<UserData?> {
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
