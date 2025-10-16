import 'package:control/di/di.dart';
import 'package:control/navigation/guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const isTesting =
    String.fromEnvironment('TESTING', defaultValue: 'false') == 'true';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  runApp(const ControlApp());
}

class ControlApp extends StatelessWidget {
  const ControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      retry: (retryCount, error) =>
          null, // TODO: maybe retry on timeout, non wrong data errors
      overrides: isTesting
          ? [
              dataProviderProvider.overrideWith(
                (ref) => ref.watch(testingDataProviderProvider),
              ),
              userDataProviderProvider.overrideWith(
                (ref) => ref.watch(testingUserDataProviderProvider),
              ),
            ]
          : [],
      child: Consumer(
        builder: (context, widgetRef, child) {
          final router = widgetRef.watch(routerProvider);
          return MaterialApp.router(
            title: 'Control App',
            theme: ThemeData(primarySwatch: Colors.blue),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
