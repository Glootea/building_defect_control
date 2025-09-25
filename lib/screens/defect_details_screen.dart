import 'package:control/domain/defect_details.dart';
import 'package:control/widgets/object_name_textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefectDetailsScreen extends HookConsumerWidget {
  final String defectId;
  final String defectName;

  const DefectDetailsScreen({
    super.key,
    required this.defectId,
    required this.defectName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onDefectNameSubmitted(String value) async {
      if (value == defectName || value.isEmpty) return;

      await ref
          .read(defectDetailsProvider(defectId).notifier)
          .saveDefectName(defectId, value);
    }

    final controller = useTextEditingController(text: defectName);

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: defectId,
          child: Material(
            type: MaterialType.transparency,
            child: TextField(
              controller: controller,
              decoration: objectNameTextFieldDecoration,
              onSubmitted: onDefectNameSubmitted,
              onTapOutside: (_) {
                onDefectNameSubmitted(controller.text);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ),
      body: const Center(child: Text('Report Details Content')),
    );
  }
}
