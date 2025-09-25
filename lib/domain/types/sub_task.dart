import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid/ulid.dart';

part 'sub_task.freezed.dart';
part 'sub_task.g.dart';

@freezed
class SubTask with _$SubTask {
  const factory SubTask({
    required String id,
    @JsonKey(name: 'task_id') required String taskId,
    required String title,
    @Default(0) int progress,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, Object?> json) =>
      _$SubTaskFromJson(json);

  factory SubTask.create(String taskId, String title) {
    return SubTask(id: Ulid().toString(), taskId: taskId, title: title);
  }
}
