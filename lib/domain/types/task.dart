import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid/ulid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    @Default("") String description,
    @JsonKey(name: 'tag_id') String? tagId,
    required int importance,
    @Default(0) int progress,
    required int regularly,
    @JsonKey(name: 'repeat_count') required int repeatCount,
    @JsonKey(name: 'start_at') DateTime? startAt,
    @JsonKey(name: 'end_at') DateTime? endAt,
    @JsonKey(name: 'start_reminder_minutes') int? startReminderMinutes,
    @JsonKey(name: 'end_reminder_minutes') int? endReminderMinutes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  factory Task.create(
    String title,
    String? tagId,
    int importance,
    int regularly,
    int repeatCount,
    DateTime? startAt,
    DateTime? endAt,
    int? startReminderMinutes,
    int? endReminderMinutes,
  ) {
    return Task(
      id: Ulid().toString(),
      title: title,
      tagId: tagId,
      importance: importance,
      regularly: regularly,
      repeatCount: repeatCount,
      startAt: startAt,
      endAt: endAt,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startReminderMinutes: startReminderMinutes,
      endReminderMinutes: endReminderMinutes,
    );
  }
}
