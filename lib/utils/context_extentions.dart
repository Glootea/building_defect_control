import 'package:control/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension Translation on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;

  /// This method must be used instead of [Navigator.popUntil] (creates infinite loop)
  void popUntil(bool Function(GoRoute route) predicate) {
    final delegate = GoRouter.of(this).routerDelegate;
    var config = delegate.currentConfiguration;
    var routes = config.routes.whereType<GoRoute>();
    while (routes.length > 1 && !predicate(config.last.route)) {
      config = config.remove(config.last);
      routes = config.routes.whereType<GoRoute>();
    }
    delegate.setNewRoutePath(config);
  }
}
