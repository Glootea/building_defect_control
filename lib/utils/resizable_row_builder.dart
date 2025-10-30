import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResizableRowBuilder extends StatefulWidget {
  final List<Widget> children;
  final List<ValueNotifier<double>>? listenables;
  final void Function() onResize;
  final String id;
  final void Function() onTap;
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
  @override
  Widget build(BuildContext context) {
    return _ResizableRowBuilder(
      listenables: widget.listenables!,
      onResize: widget.onResize,
      children: widget.children,
    );
  }
}

class _ResizableRowBuilder extends StatefulWidget {
  final List<ValueNotifier<double>> listenables;
  final List<Widget> children;
  final void Function() onResize;

  const _ResizableRowBuilder({
    required this.listenables,
    required this.children,
    required this.onResize,
  });

  @override
  State<_ResizableRowBuilder> createState() => __ResizableRowBuilderState();
}

class __ResizableRowBuilderState extends State<_ResizableRowBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(
          children: List.generate(widget.listenables.length, (index) {
            return [
              if (index != 0)
                _ResizableRowDivider(
                  totalWidth: width,
                  onDragUpdate: (deltaFraction) {
                    if (deltaFraction > 0) {
                      for (
                        int i = index - 1;
                        i < widget.listenables.length && deltaFraction > 0;
                        i++
                      ) {
                        final movedFraction = deltaFraction / width;
                        final current = widget.listenables[i].value;
                        final newValue = current + movedFraction;
                        final clampedNewValue = clampDouble(
                          newValue,
                          0.1,
                          1 - 0.1 * (widget.listenables.length - 1),
                        );
                        widget.listenables[i].value = clampedNewValue;
                        final diff = ((clampedNewValue - current) * width);
                        deltaFraction -= diff;
                        print('Carrying over deltaFraction: $deltaFraction');
                      }
                    } else {
                      for (
                        int i = index - 1;
                        i >= 0 && deltaFraction < 0;
                        i--
                      ) {
                        final movedFraction = deltaFraction / width;
                        final current = widget.listenables[i].value;
                        final newValue = current + movedFraction;
                        final clampedNewValue = clampDouble(
                          newValue,
                          0.1,
                          1 - 0.1 * (widget.listenables.length - 1),
                        );
                        widget.listenables[i].value = clampedNewValue;
                        final diff = ((clampedNewValue - current) * width);

                        deltaFraction -= diff;
                        print('Carrying over deltaFraction: $deltaFraction');
                      }
                    }
                    widget.onResize();
                  },
                ),
              ListenableBuilder(
                listenable: widget.listenables[index],
                builder: (context, _) => SizedBox(
                  width: widget.listenables[index].value * width,
                  child: widget.children[index],
                ),
              ),
            ];
          }).expand((e) => e).toList(),
        );
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
    print('Getting fractions for $id: ${_storage[id]}');
    return _storage[id];
  }

  @override
  Future<void> setFractions(String id, List<double> fractions) async {
    print('Setting fractions for $id: $fractions');
    _storage[id] = fractions;
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
