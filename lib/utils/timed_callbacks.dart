import 'package:flutter/foundation.dart';
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Throttler {
  Throttler(this.throttleGap);

  final Duration throttleGap;

  DateTime? lastActionTime;

  void run(VoidCallback action) {
    if (lastActionTime == null ||
        DateTime.now().difference(lastActionTime!) >= throttleGap) {
      action();
      lastActionTime = DateTime.now();
    }
  }
}

/// A simple debouncer that delays the execution of a task by [duration].
class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({required this.duration});

  Future<void> run(VoidCallback action) async {
    _timer?.cancel();
    _timer = Timer(duration, action);
    return Future.delayed(duration);
  }

  void dispose() {
    _timer?.cancel();
  }
}

/// A debouncer tailored for Riverpod providers. It delays the execution of building state of provider by [duration].
/// If updating the persistent state of provider, use [Debouncer] instead.
class RiverpodDebouncer {
  final Duration duration;

  RiverpodDebouncer({required this.duration});

  /// Delays the execution of a task by [duration]. If the provider is disposed
  /// before the duration elapses, the task is canceled by throwing an exception.
  Future start(Ref ref) async {
    var didDispose = false;
    ref.onDispose(() => didDispose = true);

    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (didDispose) {
      throw Exception('Request canceled');
    }
  }
}
