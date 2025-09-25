import 'package:control/di/di.dart';
import 'package:control/navigation/navigation.dart';
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
      overrides: isTesting
          ? [
              dataProviderProvider.overrideWith(
                (ref) => ref.read(testingDataProviderProvider),
              ),
              authServiceProvider.overrideWith(
                (ref) => ref.read(testingAuthServiceProvider),
              ),
            ]
          : [],
      child: MaterialApp.router(
        title: 'Control App',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}
