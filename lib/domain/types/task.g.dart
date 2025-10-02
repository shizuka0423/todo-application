// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String? ?? "",
  tagId: json['tag_id'] as String?,
  importance: (json['importance'] as num).toInt(),
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  regularly: (json['regularly'] as num).toInt(),
  repeatCount: (json['repeat_count'] as num).toInt(),
  startAt:
      json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
  endAt:
      json['end_at'] == null ? null : DateTime.parse(json['end_at'] as String),
  startReminderMinutes: (json['start_reminder_minutes'] as num?)?.toInt(),
  endReminderMinutes: (json['end_reminder_minutes'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tag_id': instance.tagId,
      'importance': instance.importance,
      'progress': instance.progress,
      'regularly': instance.regularly,
      'repeat_count': instance.repeatCount,
      'start_at': instance.startAt?.toIso8601String(),
      'end_at': instance.endAt?.toIso8601String(),
      'start_reminder_minutes': instance.startReminderMinutes,
      'end_reminder_minutes': instance.endReminderMinutes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
