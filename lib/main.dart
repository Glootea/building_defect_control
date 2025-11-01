import 'package:control/di/di.dart';
import 'package:control/l10n/app_localizations.dart';
import 'package:control/navigation/guard.dart';
import 'package:control/utils/riverpod_logger.dart';
import 'package:flutter/foundation.dart';
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
      observers: [if (kDebugMode || isTesting) Logger()],
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
              projectDataProviderProvider.overrideWith(
                (ref) => ref.watch(testingProjectDataProviderProvider),
              ),
              reportDataProviderProvider.overrideWith(
                (ref, args) =>
                    ref.watch(testingReportDataProviderProvider(args)),
              ),
              defectDataProviderProvider.overrideWith(
                (ref, args) =>
                    ref.watch(testingDefectDataProviderProvider(args)),
              ),
            ]
          : [],
      child: Consumer(
        builder: (context, widgetRef, child) {
          final router = widgetRef.watch(routerProvider);
          return MaterialApp.router(
            theme: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent,
              ),
            ),
            routerConfig: router,
            color: Colors.blue,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale('ru'),
          );
        },
      ),
    );
  }
}
