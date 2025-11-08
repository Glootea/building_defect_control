class ReportListQueryState {
  final String name;
  final String description;

  ReportListQueryState({required this.name, required this.description});

  ReportListQueryState copyWith({String? name, String? description}) {
    return ReportListQueryState(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
