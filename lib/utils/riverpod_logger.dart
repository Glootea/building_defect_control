import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    log(
      "{provider: ${context.provider}, newValue: $newValue, mutation: ${context.mutation}}",
    );
  }
}
