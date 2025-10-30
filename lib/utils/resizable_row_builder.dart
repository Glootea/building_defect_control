import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ResizableRowBuilder extends StatefulWidget {
  final List<Widget> children;
  final List<ValueNotifier<double>> listenables;
  final void Function() onResize;
  final String id;
  final void Function()? onTap;
  final ResizableRowStorage storage;
  const ResizableRowBuilder({
    super.key,
    required this.id,
    required this.storage,
    required this.children,
    required this.listenables,
    required this.onTap,
    required this.onResize,
  });

  @override
  State<ResizableRowBuilder> createState() => _ResizableRowBuilderState();
}

class _ResizableRowBuilderState extends State<ResizableRowBuilder> {
  (double clampedNewValue, double carryOver) _calculateWidthUpdate({
    required double deltaFraction,
    required ValueListenable<double> listenable,
    required double width,
  }) {
    final movedFraction = deltaFraction / width;
    final current = listenable.value;
    final newValue = current + movedFraction;
    final clampedNewValue = clampDouble(
      newValue,
      0.1,
      1 - 0.1 * (widget.listenables.length - 1),
    );
    final diff = ((clampedNewValue - current) * width);

    return (clampedNewValue, diff);
  }

  void _onDragUpdate({
    required double deltaFraction,
    required int index,
    required double width,
  }) {
    for (
      int i = index - 1;
      (deltaFraction > 0)
          ? (i < widget.listenables.length && deltaFraction > 0)
          : (i >= 0 && deltaFraction < 0);
      (deltaFraction > 0) ? i++ : i--
    ) {
      final (clampedNewValue, carryOver) = _calculateWidthUpdate(
        deltaFraction: deltaFraction,
        listenable: widget.listenables[i],
        width: width,
      );

      widget.listenables[i].value = clampedNewValue;
      deltaFraction -= carryOver;
    }

    widget.onResize();
  }

  List<Widget> buildChildren(double width) {
    final iconSize = (Theme.of(context).iconTheme.size ?? 24) / 1.5;
    return List.generate(widget.listenables.length, (index) {
      return [
        (index != 0)
            ? _ResizableRowDivider(
                totalWidth: width,
                onDragUpdate: (deltaFraction) {
                  _onDragUpdate(
                    deltaFraction: deltaFraction,
                    index: index,
                    width: width,
                  );
                },
              )
            : (widget.onTap != null)
            ? IconButton(
                onPressed: widget.onTap,
                icon: Icon(Icons.open_in_new_outlined, size: iconSize),
              )
            : SizedBox(width: iconSize * 2.5),
        ListenableBuilder(
          listenable: widget.listenables[index],
          builder: (context, _) => SizedBox(
            width: widget.listenables[index].value * width,
            child: widget.children[index],
          ),
        ),
      ];
    }).expand((e) => e).toList();
  }

  @override
  Widget build(BuildContext context) {
    final _ = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(children: buildChildren(width));
      },
    );
  }
}

abstract interface class ResizableRowStorage {
  Future<List<double>?> getFractions(String id);
  Future<void> setFractions(String id, List<double> fractions);
}

class InMemoryResizableRowStorage implements ResizableRowStorage {
  final Map<String, List<double>> _storage = {};

  @override
  Future<List<double>?> getFractions(String id) async {
    log('Getting fractions for $id: ${_storage[id]}');
    return _storage[id];
  }

  @override
  Future<void> setFractions(String id, List<double> fractions) async {
    log('Setting fractions for $id: $fractions');
    _storage[id] = fractions;
  }
}

class SecureStorageResizableRowStorage implements ResizableRowStorage {
  final FlutterSecureStorage secureStorage;
  final String id;

  SecureStorageResizableRowStorage({
    required this.id,
    required this.secureStorage,
  });

  @override
  Future<List<double>?> getFractions(String id) async {
    final str = await secureStorage.read(key: id);
    if (str == null) return null;
    return _stringToFractions(str);
  }

  @override
  Future<void> setFractions(String id, List<double> fractions) async {
    final str = _fractionsToString(fractions);
    await secureStorage.write(key: id, value: str);
  }

  String _fractionsToString(List<double> fractions) {
    return fractions.map((e) => e.toString()).join('^');
  }

  List<double> _stringToFractions(String str) {
    return str.split('^').map((e) => double.parse(e)).toList();
  }
}

class _ResizableRowDivider extends StatefulWidget {
  final double totalWidth;
  final void Function(double deltaFraction) onDragUpdate;
  const _ResizableRowDivider({
    required this.onDragUpdate,
    required this.totalWidth,
  });

  @override
  State<_ResizableRowDivider> createState() => __ResizableRowDividerState();
}

class __ResizableRowDividerState extends State<_ResizableRowDivider> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          widget.onDragUpdate(details.delta.dx);
        },
        child: UnconstrainedBox(
          child: SizedBox(
            width: 16,
            height: 32,
            child: ColoredBox(
              color: Colors.transparent,
              child: VerticalDivider(
                color: isHovering ? Theme.of(context).dividerColor : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
