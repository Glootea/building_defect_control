// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
part 'models.freezed.dart';
part 'models.g.dart';

@JsonSerializable()
@Freezed()
class UserData with _$UserData {
  const UserData({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    // ?post
  });

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  final String firstName;
  final String middleName;
  final String lastName;
}

@JsonSerializable()
@freezed
class Defect with _$Defect {
  const Defect({
    required this.id,
    required this.name,
    required this.description,
    required this.classification,
    required this.status,
  });

  factory Defect.fromJson(Map<String, Object?> json) => _$DefectFromJson(json);

  Map<String, dynamic> toJson() => _$DefectToJson(this);

  final String id;
  final String name;
  final String classification;
  final String description;
  final DefectStatus status;
}

@JsonSerializable()
@freezed
class DefectElimination with _$DefectElimination {
  const DefectElimination({
    required this.id,
    required this.defectId,
    required this.startDate,
    required this.endDate,
    required this.priority,
  });

  factory DefectElimination.fromJson(Map<String, Object?> json) =>
      _$DefectEliminationFromJson(json);

  Map<String, dynamic> toJson() => _$DefectEliminationToJson(this);

  final String id;
  final String defectId;
  final DateTime startDate;
  final DateTime endDate;
  final Priority priority;
}

enum DefectStatus { open, inProgress, onReview, resolved, closed }

@JsonSerializable()
@freezed
class Role with _$Role {
  const Role({required this.id, required this.name});

  factory Role.fromJson(Map<String, Object?> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  final String id;
  final String name;
}

enum Priority { low, medium, high }

@JsonSerializable()
@freezed
class ProjectShallow with _$ProjectShallow {
  const ProjectShallow({required this.id, required this.name});

  factory ProjectShallow.fromJson(Map<String, Object?> json) =>
      _$ProjectShallowFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectShallowToJson(this);

  final String id;
  final String name;
}

@JsonSerializable()
@freezed
class Project with _$Project {
  const Project({required this.id, required this.name, required this.defects});

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  final String id;
  final String name;
  final List<Defect> defects;
}

@JsonSerializable()
@freezed
class Report with _$Report {
  const Report({
    required this.id,
    required this.projectId,
    required this.name,
    required this.description,
    required this.submissionDate,
  });

  factory Report.fromJson(Map<String, Object?> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);

  final String id;
  final String projectId;
  final String name;
  final String description;
  final DateTime submissionDate;
}

@JsonSerializable()
@freezed
class ReportAttachment with _$ReportAttachment {
  const ReportAttachment({
    required this.id,
    required this.reportId,
    required this.dataFileLink,
  });

  factory ReportAttachment.fromJson(Map<String, Object?> json) =>
      _$ReportAttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$ReportAttachmentToJson(this);

  final String id;
  final String reportId;
  final String dataFileLink;
}
