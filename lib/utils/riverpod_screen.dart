import 'package:control/utils/network_errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodScreen<T> extends StatefulWidget {
  final Widget Function(T data) child;
  final AsyncValue<T> state;
  const RiverpodScreen({required this.child, required this.state, super.key});

  @override
  State<RiverpodScreen<T>> createState() => _RiverpodScreenState<T>();
}

class _RiverpodScreenState<T> extends State<RiverpodScreen<T>> {
  Object? lastError;

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

    final duration = const Duration(milliseconds: 500);
    return AnimatedCrossFade(
      // alignment: Alignment.bottomCenter,
      firstChild: CircularProgressIndicator(),
      secondChild: widget.child(widget.state.value as T),
      crossFadeState: widget.state.isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: duration,
    );
  }
}
