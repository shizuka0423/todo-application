// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      id: json['id'] as String,
      taskId: json['task_id'] as String,
      title: json['title'] as String,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'title': instance.title,
      'progress': instance.progress,
    };
