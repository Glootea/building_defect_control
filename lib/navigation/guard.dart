import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:control/di/di.dart';
import 'package:control/domain/user/user.dart';
import 'package:control/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: rewrite guard to separate navigation service to clean stack on login/logout
typedef _GoRouterRedirect =
    FutureOr<String?> Function(BuildContext context, GoRouterState state);

final routerProvider = Provider((ref) {
  final _ = ref.watch(userProvider.select((s) => s.value));
  final navigationStackObserver = ref.watch(navigatorStackObserverProvider);
  return _routeConfig(
    observers: [navigationStackObserver],
    redirect: (context, state) {
      final authState = ref.read(userProvider);

      log('Router redirect called. Auth state: $authState');

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

GoRouter _routeConfig({
  _GoRouterRedirect? redirect,
  List<NavigatorObserver>? observers,
}) => GoRouter(
  routes: $appRoutes,
  initialLocation: AuthRoute().location,
  redirect: redirect,
  observers: observers,
);

class ControlNavigatorObserver extends NavigatorObserver with ChangeNotifier {
  final _navigationStack = <Route>[];
  List<Route> getStack() => UnmodifiableListView(_navigationStack);

  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    notifyListeners();
    super.didChangeTop(topRoute, previousTopRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _navigationStack.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _navigationStack.removeLast();
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _navigationStack.removeLast();
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null) {
      _navigationStack.removeLast();
    }
    if (newRoute != null) {
      _navigationStack.add(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
