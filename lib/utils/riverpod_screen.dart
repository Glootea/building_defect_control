import 'package:control/utils/network_errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodScreen<T> extends StatefulWidget {
  final Widget Function(T data) builder;
  final AsyncValue<T> state;
  final bool useSliver;
  const RiverpodScreen({
    required this.builder,
    required this.state,
    this.useSliver = false,
    super.key,
  });

  @override
  State<RiverpodScreen<T>> createState() => _RiverpodScreenState<T>();
}

class _RiverpodScreenState<T> extends State<RiverpodScreen<T>> {
  Object? lastError;

  final duration = const Duration(milliseconds: 500);
  late final animationController = AnimationController(
    vsync: Scaffold.of(context),
    duration: duration,
  );
  late final animation = CurvedAnimation(
    curve: Curves.easeInOut,
    parent: animationController,
  );

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RiverpodScreen<T> oldWidget) {
    if (oldWidget.state.isLoading && !widget.state.isLoading) {
      animationController.reset();
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.state.isLoading && widget.state.hasError) {
      if (widget.state.error != lastError) {
        lastError = widget.state.error;
        final error = widget.state.error;

        final message = switch (error) {
          DioException dioError => dioError.format(context),
          Exception e => e.toString(),
          _ => 'An unexpected error occurred',
        };
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          }
        });
      }
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    lastError = widget.state.error;

    if (widget.useSliver) {
      return SliverFadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        sliver: (widget.state.isLoading)
            ? const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              )
            : widget.builder(widget.state.value as T),
      );
    }
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
      child: (widget.state.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : widget.builder(widget.state.value as T),
    );
  }
}
