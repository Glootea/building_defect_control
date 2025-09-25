// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defect _$DefectFromJson(Map<String, dynamic> json) => Defect(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  classification: json['classification'] as String,
  status: $enumDecode(_$DefectStatusEnumMap, json['status']),
);

Map<String, dynamic> _$DefectToJson(Defect instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'classification': instance.classification,
  'description': instance.description,
  'status': _$DefectStatusEnumMap[instance.status]!,
};

const _$DefectStatusEnumMap = {
  DefectStatus.open: 'open',
  DefectStatus.inProgress: 'inProgress',
  DefectStatus.onReview: 'onReview',
  DefectStatus.resolved: 'resolved',
  DefectStatus.closed: 'closed',
};

DefectElimination _$DefectEliminationFromJson(Map<String, dynamic> json) =>
    DefectElimination(
      id: json['id'] as String,
      defectId: json['defectId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
    );

Map<String, dynamic> _$DefectEliminationToJson(DefectElimination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'defectId': instance.defectId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'priority': _$PriorityEnumMap[instance.priority]!,
    };

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
};

Role _$RoleFromJson(Map<String, dynamic> json) =>
    Role(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

ProjectShallow _$ProjectShallowFromJson(Map<String, dynamic> json) =>
    ProjectShallow(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$ProjectShallowToJson(ProjectShallow instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: json['id'] as String,
  name: json['name'] as String,
  defects: (json['defects'] as List<dynamic>)
      .map((e) => Defect.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'defects': instance.defects,
};

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  submissionDate: DateTime.parse(json['submissionDate'] as String),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'name': instance.name,
  'description': instance.description,
  'submissionDate': instance.submissionDate.toIso8601String(),
};

ReportAttachment _$ReportAttachmentFromJson(Map<String, dynamic> json) =>
    ReportAttachment(
      id: json['id'] as String,
      reportId: json['reportId'] as String,
      dataFileLink: json['dataFileLink'] as String,
    );

Map<String, dynamic> _$ReportAttachmentToJson(ReportAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportId': instance.reportId,
      'dataFileLink': instance.dataFileLink,
    };
