import 'package:flutter/material.dart';

class CollapsingSearchbar extends StatefulWidget {
  final void Function(String) onChanged;
  const CollapsingSearchbar({required this.onChanged, super.key});

  @override
  State<CollapsingSearchbar> createState() => _CollapsingSearchbarState();
}

class _CollapsingSearchbarState extends State<CollapsingSearchbar> {
  bool isExpanded = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            isExpanded = !isExpanded;
            if (isExpanded) {
              _focusNode.requestFocus();
            } else {
              _focusNode.unfocus();
            }
            setState(() {});
          },
          icon: Icon(Icons.search_outlined),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: isExpanded ? 200 : 0,
            child: TextField(
              focusNode: _focusNode,
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
