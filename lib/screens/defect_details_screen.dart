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
      _DefectDetailsBody(defectProvider, defectId),
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
                ? CustomScrollView(slivers: bodyContent)
                : Row(children: _getRowContent(bodyContent));
          },
        ),
      ),
    );
  }

  List<Widget> _getRowContent(List<Widget> bodyContent) {
    return bodyContent.indexed
        .map(
          (e) => [
            if (e.$1 != 0) const VerticalDivider(),
            CustomScrollView(slivers: [e.$2]),
          ],
        )
        .expand((e) => e)
        .map((e) => (e is! VerticalDivider) ? Expanded(child: e) : e)
        .toList();
  }
}

class _DefectDetailsAppBarTitle extends HookConsumerWidget {
  final String defectId;
  final String defectName;

  const _DefectDetailsAppBarTitle({
    required this.defectId,
    required this.defectName,
  });

  Future<void> onDefectNameSubmitted(
    DefectDetails defectDetails,
    String value,
  ) async {
    if (value == defectName || value.isEmpty) return;

    await defectDetails.saveDefectName(defectId, value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: defectName);
    final defectDetails = ref.watch(defectDetailsProvider(defectId).notifier);

    return Hero(
      tag: defectId,
      child: Material(
        type: MaterialType.transparency,
        child: TextField(
          controller: controller,
          decoration: objectNameTextFieldDecoration,
          onSubmitted: (value) => onDefectNameSubmitted(defectDetails, value),
          onTapOutside: (_) {
            onDefectNameSubmitted(defectDetails, controller.text);
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}

class _DefectDetailsBody extends HookConsumerWidget {
  final DefectDetails defectDetails;
  final String defectId;
  const _DefectDetailsBody(this.defectDetails, this.defectId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defect = ref.watch(defectDetailsProvider(defectId));
    if (defect.isLoading) {
      return SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (defect.hasError) {
      return SliverToBoxAdapter(
        child: Center(child: Text('Error: ${defect.error}')),
      );
    }
    final defectState = defect.requireValue;

    final classificationController = useTextEditingController(
      text: defectState.classification,
    );
    final descriptionController = useTextEditingController(
      text: defectState.description,
    );
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

    Future<void> onChangeClassification(String value) async {
      if (value == defectState.classification || value.isEmpty) return;

      await defectDetails.updateDefect(
        defectState.copyWith(classification: value),
      );
    }

    Future<void> onChangeDescription(String value) async {
      if (value == defectState.description || value.isEmpty) return;

      await defectDetails.updateDefect(
        defectState.copyWith(description: value),
      );
    }

    final items = [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Defect Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Classification'),
          TextField(
            controller: classificationController,
            onSubmitted: (value) => onChangeClassification(value),
            onTapOutside: (_) {
              onChangeClassification(classificationController.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description'),
          TextField(
            controller: descriptionController,
            maxLines: null,
            onSubmitted: (value) => onChangeDescription(value),
            onTapOutside: (_) {
              onChangeDescription(descriptionController.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status'),
          DropdownMenu<models.DefectStatus>(
            expandedInsets: EdgeInsets.zero,
            initialSelection: defectState.status,
            enableFilter: true,
            onSelected: (value) {
              if (value == null || value == defectState.status) return;
              defectDetails.updateDefect(defectState.copyWith(status: value));
            },
            dropdownMenuEntries: models.DefectStatus.values
                .map((e) => DropdownMenuEntry(value: e, label: e.name))
                .toList(),
          ),
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Executor'),
          DropdownMenu(
            expandedInsets: EdgeInsets.zero,

            enableFilter: true,
            controller: executorController,

            dropdownMenuEntries: executorList.value
                .map((e) => DropdownMenuEntry(value: e, label: e))
                .toList(),
          ),
        ],
      ),
    ];

    return SliverList.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
      separatorBuilder: (context, index) =>
          (index != 0) ? const SizedBox(height: 8) : SizedBox(height: 16),
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

    return eliminationProvider.when(
      data: (data) {
        if (data == null) {
          return SliverToBoxAdapter(
            child: Center(
              child: TextButton(
                onPressed: eliminationProviderNotifier.createDefectElimination,
                child: Text('Create elimination'),
              ),
            ),
          );
        }
        final items = [
          _DefectEliminationTitleRow(
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
          _DefectEliminationStartDateButton(
            data: data,
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
          _DefectEliminationEndDateButton(
            data: data,
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
        ];
        return SliverList.separated(
          itemCount: items.length,
          itemBuilder: (context, index) => items[index],
          separatorBuilder: (context, index) =>
              (index != 0) ? const SizedBox(height: 8) : SizedBox(height: 16),
        );
      },

      error: (error, stacktrace) =>
          SliverToBoxAdapter(child: Text('Error: $error')),
      loading: () =>
          SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
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

class _DefectEliminationStartDateButton extends StatelessWidget {
  final DefectElimination eliminationProviderNotifier;
  final models.DefectElimination data;

  const _DefectEliminationStartDateButton({
    required this.eliminationProviderNotifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return _DefectEliminationDateRow(
      title: 'Start date: ',
      date: data.startDate,
      onTimeSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(startDate: selectedDate),
      onDateSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(startDate: selectedDate),
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
    return _DefectEliminationDateRow(
      title: 'End date: ',
      date: data.endDate,
      onTimeSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(endDate: selectedDate),
      onDateSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(endDate: selectedDate),
    );
  }
}

class _DefectEliminationDateRow extends StatelessWidget {
  final String title;
  final DateTime date;
  final Function(DateTime selectedDate) onTimeSelected;
  final Function(DateTime selectedDate) onDateSelected;

  const _DefectEliminationDateRow({
    required this.title,
    required this.date,
    required this.onTimeSelected,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        TextButton(
          onPressed: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(date),
            );
            if (time == null) return;
            final newDate = date.copyWith(hour: time.hour, minute: time.minute);
            return onTimeSelected(newDate);
          },
          child: Text(date.toLocal().toShortTimeString()),
        ),
        TextButton(
          onPressed: () async {
            final now = DateTime.now();
            final selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
              lastDate: now.add(const Duration(days: 28)),
              initialDate: now,
            );
            if (selectedDate == null) return;

            final dateWithTime = selectedDate.copyWith(
              hour: date.hour,
              minute: date.minute,
            );

            return onDateSelected(dateWithTime);
          },
          child: Text(date.toLocal().toShortDateString()),
        ),
      ],
    );
  }
}
