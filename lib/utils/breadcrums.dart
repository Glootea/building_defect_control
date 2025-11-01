import 'package:control/di/di.dart';
import 'package:control/navigation/navigation.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;

class Breadcrums extends StatelessWidget {
  const Breadcrums({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          final navigatorStackObserver = ref.watch(
            navigatorStackObserverProvider,
          );
          final visibleRoutes = _getVisibleRoutes(
            navigatorStackObserver.getStack(),
          );
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  if (visibleRoutes.length > 1)
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back_outlined),
                    ),

                  ..._generateParts(context, visibleRoutes),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _generateParts(
    BuildContext context,
    List<Route> visibleRoutes,
  ) => List.generate(
    visibleRoutes.length,
    (index) => _generatePart(context, visibleRoutes, index),
    growable: false,
  ).expand((e) => e).toList();

  List<Route> _getVisibleRoutes(List<Route> routes) =>
      routes.where((e) => !_isPageHidden(e)).toList();
  bool _isPageHidden(Route route) => route.settings.name == RouteNames.auth;

  List<Widget> _generatePart(
    BuildContext context,
    List<Route> navigatorStack,
    int index,
  ) => [
    Transform.rotate(angle: math.pi / 6, child: VerticalDivider()),
    TextButton(
      onPressed: (index != navigatorStack.length - 1)
          ? () {
              context.popUntil(
                (route) => route.name == navigatorStack[index].settings.name!,
              );
            }
          : null,
      child: Text(
        RouteNames.translate(navigatorStack[index].settings.name, context),
      ),
    ),
  ];
}
