import 'package:flutter/widgets.dart';

enum QueryType { text, select }

abstract class Query<T> {
  final QueryType type;
  final void Function(T? value) onUpdate;
  final T value;
  final String title;

  const Query({
    required this.type,
    required this.onUpdate,
    required this.title,
    required this.value,
  });
}

class TextQuery extends Query<String> {
  const TextQuery({
    required super.onUpdate,
    required super.title,
    required super.value,
  }) : super(type: QueryType.text);
}

class SelectQuery<T> extends Query<T> {
  final List<T> options;
  final String Function(BuildContext context, T value) itemLocalStringBuilder;

  const SelectQuery({
    required super.onUpdate,
    required super.title,
    required this.options,
    required super.value,
    required this.itemLocalStringBuilder,
  }) : super(type: QueryType.select);
}
