import 'package:flutter/foundation.dart';

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
