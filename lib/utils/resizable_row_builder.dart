import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResizableRowBuilder extends StatefulWidget {
  final List<Widget> children;
  final String id;
  final void Function() onTap;
  final ResizableRowStorage storage;
  const ResizableRowBuilder({
    super.key,
    required this.id,
    required this.storage,
    required this.children,
    required this.onTap,
  });

  @override
  State<ResizableRowBuilder> createState() => _ResizableRowBuilderState();
}

class _ResizableRowBuilderState extends State<ResizableRowBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: widget.storage.getFractions(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return _ResizableRowBuilder(
            fractions:
                snapshot.data ??
                List.filled(
                  widget.children.length,
                  1.0 / widget.children.length,
                ),
            children: widget.children,
          );
        },
      ),
    );
  }
}

class _ResizableRowBuilder extends StatefulWidget {
  final List<double> fractions;
  final List<Widget> children;

  const _ResizableRowBuilder({required this.fractions, required this.children});

  @override
  State<_ResizableRowBuilder> createState() => __ResizableRowBuilderState();
}

class __ResizableRowBuilderState extends State<_ResizableRowBuilder> {
  late List<ValueNotifier<double>> listenables = List.generate(
    widget.fractions.length,
    (index) => ValueNotifier(widget.fractions[index]),
    growable: false,
  );

  @override
  void didUpdateWidget(covariant _ResizableRowBuilder oldWidget) {
    listenables = List.generate(
      widget.fractions.length,
      (index) => ValueNotifier(widget.fractions[index]),
      growable: false,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(
          children: List.generate(widget.children.length, (index) {
            return [
              if (index != 0)
                _ResizableRowDivider(
                  totalWidth: width,
                  onDragUpdate: (deltaFraction) {
                    if (deltaFraction > 0) {
                      for (
                        int i = index - 1;
                        i < widget.fractions.length && deltaFraction > 0;
                        i++
                      ) {
                        final movedFraction = deltaFraction / width;
                        final current = listenables[i].value;
                        final newValue = current + movedFraction;
                        final clampedNewValue = clampDouble(
                          newValue,
                          0.1,
                          1 - 0.1 * (widget.fractions.length - 1),
                        );
                        listenables[i].value = clampedNewValue;
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
                        final current = listenables[i].value;
                        final newValue = current + movedFraction;
                        final clampedNewValue = clampDouble(
                          newValue,
                          0.1,
                          1 - 0.1 * (widget.fractions.length - 1),
                        );
                        listenables[i].value = clampedNewValue;
                        final diff = ((clampedNewValue - current) * width);

                        deltaFraction -= diff;
                        print('Carrying over deltaFraction: $deltaFraction');
                      }
                    }
                  },
                ),
              ListenableBuilder(
                listenable: listenables[index],
                builder: (context, _) => SizedBox(
                  width: listenables[index].value * width,
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
    return _storage[id];
  }

  @override
  Future<void> setFractions(String id, List<double> fractions) async {
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
