import 'package:control/models/models.dart';

class ReportListQueryState {
  final String name;
  final String description;
  final String classification;
  final DefectStatus? status;

  ReportListQueryState({
    required this.name,
    required this.description,
    required this.classification,
    required this.status,
  });

  ReportListQueryState copyWith({
    String? name,
    String? description,
    String? classification,
    DefectStatus? status,
  }) {
    return ReportListQueryState(
      name: name ?? this.name,
      description: description ?? this.description,
      classification: classification ?? this.classification,
      status: status ?? this.status,
    );
  }
}
