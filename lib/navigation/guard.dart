import 'dart:async';

import 'package:control/domain/user.dart';
import 'package:control/navigation/navigation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef _GoRouterRedirect =
    FutureOr<String?> Function(BuildContext context, GoRouterState state);

final routerProvider = Provider((ref) {
  final authState = ref.watch(userProvider);
  return _routeConfig(
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) return null;

      final isAuthenticated = authState.value != null;
      final isAuthenticating = state.matchedLocation == AuthRoute().location;

      if (!isAuthenticated) {
        return AuthRoute().location;
      }

      if (isAuthenticating && isAuthenticated) {
        return ProjectsListRoute().location;
      }

      return null;
    },
  );
});

GoRouter _routeConfig({_GoRouterRedirect? redirect}) => GoRouter(
  routes: $appRoutes,
  initialLocation: AuthRoute().location,
  redirect: redirect,
);
