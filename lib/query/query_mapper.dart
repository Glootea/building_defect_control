import 'package:control/models/models.dart';
import 'package:control/query/query.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:flutter/material.dart';

class QueryDialogBuilder extends StatelessWidget {
  final List<Query> queries;
  const QueryDialogBuilder({super.key, required this.queries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(context.translate.filter),
        ...queries.map(
          (query) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: QueryMapper(query: query),
          ),
        ),
      ],
    );
  }
}

class QueryMapper<T> extends StatelessWidget {
  final Query<T> query;
  const QueryMapper({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return switch (query.value) {
      String _ => TextQueryWidget(query: query as TextQuery),
      _ when query is SelectQuery<DefectStatus?> =>
        SelectQueryWidget<DefectStatus?>(
          query: query as SelectQuery<DefectStatus?>,
        ),
      _ => throw UnimplementedError(
        'Query type not implemented in QueryMapper: ${query.runtimeType}',
      ),
    };
  }
}

class TextQueryWidget extends StatefulWidget {
  final TextQuery query;
  const TextQueryWidget({super.key, required this.query});

  @override
  State<TextQueryWidget> createState() => _TextQueryWidgetState();
}

class _TextQueryWidgetState extends State<TextQueryWidget> {
  late TextEditingController controller = TextEditingController(
    text: widget.query.value,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: widget.query.title),
      controller: controller,
      onChanged: widget.query.onUpdate,
    );
  }
}

class SelectQueryWidget<T> extends StatelessWidget {
  final SelectQuery<T> query;
  const SelectQueryWidget({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: query.value,
      decoration: InputDecoration(labelText: query.title),
      items: query.options
          .map(
            (option) => DropdownMenuItem(
              value: option,
              child: Text(query.itemLocalStringBuilder(context, option)),
            ),
          )
          .toList(),
      onChanged: (value) => (value != null) ? query.onUpdate(value) : null,
    );
  }
}
