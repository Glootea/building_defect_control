import 'package:control/domain/defect_details.dart';
import 'package:control/domain/defect_elimination.dart';
import 'package:control/models/models.dart' as models;
import 'package:control/utils/datetime_formatter.dart';
import 'package:control/utils/object_name_textfield_decoration.dart';
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
    final defectProvider = ref.read(defectDetailsProvider(defectId).notifier);

    final bodyContent = [
      _DefectDetailsBody(defectProvider),
      _DefectDetailsElimination(defectId),
    ];
    return Scaffold(
      appBar: AppBar(
        title: _DefectDetailsAppBarTitle(
          defectId: defectId,
          defectName: defectName,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return (constraints.maxWidth < 600)
                ? ListView.separated(
                    itemCount: bodyContent.length,
                    itemBuilder: (context, index) => bodyContent[index],
                    separatorBuilder: (context, index) => const Divider(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: bodyContent,
                  );
          },
        ),
      ),
    );
  }
}

class _DefectDetailsAppBarTitle extends HookConsumerWidget {
  final String defectId;
  final String defectName;

  const _DefectDetailsAppBarTitle({
    required this.defectId,
    required this.defectName,
  });

  Future<void> onDefectNameSubmitted(WidgetRef ref, String value) async {
    if (value == defectName || value.isEmpty) return;

    await ref
        .read(defectDetailsProvider(defectId).notifier)
        .saveDefectName(defectId, value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: defectName);

    return Hero(
      tag: defectId,
      child: Material(
        type: MaterialType.transparency,
        child: TextField(
          controller: controller,
          decoration: objectNameTextFieldDecoration,
          onSubmitted: (value) => onDefectNameSubmitted(ref, value),
          onTapOutside: (_) {
            onDefectNameSubmitted(ref, controller.text);
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}

class _DefectDetailsBody extends HookConsumerWidget {
  final DefectDetails defectDetails;
  const _DefectDetailsBody(this.defectDetails);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classificationController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final executorController = useTextEditingController();
    final executorList = useState(<String>[]);

    Future<void> fetchExecutors() async {
      final suggestions = await defectDetails.getExecutorsSuggestions(
        executorController.text,
      );
      executorList.value = suggestions;
    }

    useEffect(() {
      executorController.addListener(fetchExecutors);
      fetchExecutors();

      return () => executorController.removeListener(fetchExecutors);
    }, []);

    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            spacing: 8,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Defect Details',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              TextField(
                controller: classificationController,
                decoration: InputDecoration(hintText: 'Classification'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
                maxLines: null,
              ),
              DropdownMenu(
                expandedInsets: EdgeInsets.zero,
                hintText: 'Status',
                helperText: 'Select a status',
                enableFilter: true,
                dropdownMenuEntries: models.DefectStatus.values
                    .map((e) => DropdownMenuEntry(value: e.name, label: e.name))
                    .toList(),
              ),
              DropdownMenu(
                expandedInsets: EdgeInsets.zero,
                hintText: 'Executor',
                helperText: 'Select an executor',
                enableFilter: true,
                controller: executorController,

                dropdownMenuEntries: executorList.value
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefectDetailsElimination extends HookConsumerWidget {
  final String defectId;
  const _DefectDetailsElimination(this.defectId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eliminationProvider = ref.watch(defectEliminationProvider(defectId));
    final eliminationProviderNotifier = ref.read(
      defectEliminationProvider(defectId).notifier,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: eliminationProvider.when(
            data: (data) => (data == null)
                ? TextButton(
                    onPressed:
                        eliminationProviderNotifier.createDefectElimination,
                    child: Text('Create elimination'),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _DefectEliminationTitleRow(
                        eliminationProviderNotifier:
                            eliminationProviderNotifier,
                      ),
                      _DefectEliminationStartDateButton(
                        data: data,
                        eliminationProviderNotifier:
                            eliminationProviderNotifier,
                      ),
                      _DefectEliminationEndDateButton(
                        data: data,
                        eliminationProviderNotifier:
                            eliminationProviderNotifier,
                      ),
                    ],
                  ),
            error: (error, stacktrace) => Text('Error: $error'),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

class _DefectEliminationStartDateButton extends StatelessWidget {
  final DefectElimination eliminationProviderNotifier;
  final models.DefectElimination data;

  const _DefectEliminationStartDateButton({
    required this.eliminationProviderNotifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Start date: '),
        TextButton(
          onPressed: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(data.startDate),
            );
            if (time == null) return;

            return eliminationProviderNotifier.updateDefect(
              startDate: data.startDate.copyWith(
                hour: time.hour,
                minute: time.minute,
              ),
            );
          },
          child: Text(data.startDate.toLocal().toShortTimeString()),
        ),
        TextButton(
          onPressed: () async {
            final now = DateTime.now();
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
              lastDate: now.add(const Duration(days: 28)),
              initialDate: now,
            );
            if (date == null) return;

            final dateWithTime = date.copyWith(
              hour: data.startDate.hour,
              minute: data.startDate.minute,
            );
            return eliminationProviderNotifier.updateDefect(
              startDate: dateWithTime,
            );
          },
          child: Text(data.startDate.toLocal().toShortDateString()),
        ),
      ],
    );
  }
}

class _DefectEliminationEndDateButton extends StatelessWidget {
  final DefectElimination eliminationProviderNotifier;
  final models.DefectElimination data;

  const _DefectEliminationEndDateButton({
    required this.eliminationProviderNotifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('End date: '),
        TextButton(
          onPressed: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(data.endDate),
            );
            if (time == null) return;

            return eliminationProviderNotifier.updateDefect(
              endDate: data.endDate.copyWith(
                hour: time.hour,
                minute: time.minute,
              ),
            );
          },
          child: Text(data.endDate.toLocal().toShortTimeString()),
        ),
        TextButton(
          onPressed: () async {
            final now = DateTime.now();
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
              lastDate: now.add(const Duration(days: 28)),
              initialDate: now,
            );
            if (date == null) return;

            final dateWithTime = date.copyWith(
              hour: data.endDate.hour,
              minute: data.endDate.minute,
            );

            return eliminationProviderNotifier.updateDefect(
              endDate: dateWithTime,
            );
          },
          child: Text(data.endDate.toLocal().toShortDateString()),
        ),
      ],
    );
  }
}

class _DefectEliminationTitleRow extends StatelessWidget {
  final DefectElimination eliminationProviderNotifier;

  const _DefectEliminationTitleRow({required this.eliminationProviderNotifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 16,
      children: [
        Text(
          'Defect Elimination',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: eliminationProviderNotifier.deleteDefectElimination,
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
        ),
      ],
    );
  }
}
