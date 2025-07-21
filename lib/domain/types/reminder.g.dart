// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      taskId: json['task_id'] as String,
      reminderId: (json['reminder_id'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      scheduleAt: DateTime.parse(json['schedule_at'] as String),
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'reminder_id': instance.reminderId,
      'type': instance.type,
      'schedule_at': instance.scheduleAt.toIso8601String(),
    };
