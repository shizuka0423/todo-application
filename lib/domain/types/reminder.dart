import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'reminder_id') required int reminderId,
    required int type,
    @JsonKey(name: 'schedule_at') required DateTime scheduleAt,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) =>
      _$ReminderFromJson(json);

  factory Reminder.create(
    String taskId,
    int reminderId,
    int type,
    DateTime scheduleAt,
  ) {
    return Reminder(
      taskId: taskId,
      reminderId: reminderId,
      type: type,
      scheduleAt: scheduleAt,
    );
  }
}
