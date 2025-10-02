import 'package:flutter_todo_application/application/config/notification_service.dart';
import 'package:flutter_todo_application/application/state/reminder_notifier.dart';
import 'package:flutter_todo_application/application/state/task_notifier.dart';
import 'package:flutter_todo_application/domain/types/reminder.dart';
import 'package:flutter_todo_application/domain/types/reminder_type.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_notifier.g.dart';

@riverpod
class RegistrationNotifier extends _$RegistrationNotifier {
  @override
  void build() {}

  Future<void> create(
    String title,
    String? tagId,
    int importance,
    int regularly,
    int repeatCount,
    DateTime? startAt,
    DateTime? endAt,
    int? startReminderMinutes,
    int? endReminderMinutes,
  ) async {
    final task = Task.create(
      title,
      tagId,
      importance,
      regularly,
      repeatCount,
      startAt,
      endAt,
      startReminderMinutes,
      endReminderMinutes,
    );
    await ref.read(todoRepositoryProvider).insert(task);

    final now = DateTime.now();
    if (startReminderMinutes != null &&
        startAt != null &&
        startAt.isAfter(now)) {
      final type = ReminderType.start.index;
      _createReminder(task.id, title, type, startAt, startReminderMinutes);
    }

    if (endReminderMinutes != null && endAt != null && endAt.isAfter(now)) {
      final type = ReminderType.end.index;
      _createReminder(task.id, title, type, endAt, endReminderMinutes);
    }

    ref.read(taskNotifierProvider.notifier).addTask(task);
  }

  Future<void> _createReminder(
    String taskId,
    String title,
    int type,
    DateTime scheduleAt,
    int beforeMinute,
  ) async {
    final reminderId = _getRemindIdNumber(type);
    final reminder = Reminder.create(taskId, reminderId, type, scheduleAt);
    await ref.read(todoRepositoryProvider).reminderInsert(reminder);
    await NotificationService().scheduleNotification(
      reminderId,
      scheduleAt,
      beforeMinute,
      title,
    );
    ref.read(reminderNotifierProvider.notifier).upsertReminder(reminder);
  }

  int _getRemindIdNumber(int suffix) {
    return DateTime.now().millisecondsSinceEpoch * 10 + suffix;
  }
}

// final reminderId = _getRemindIdNumber(type);
      // final reminder = Reminder.create(task.id, reminderId, type, startAt);
      // await ref.read(todoRepositoryProvider).reminderInsert(reminder);
      // await notifyService.scheduleNotification(
      //   reminderId,
      //   startAt,
      //   remindMinute,
      //   title,
      // );
      // ref.read(reminderNotifierProvider.notifier).addReminder(reminder);

// final reminderId = _getRemindIdNumber(type);
      // final reminder = Reminder.create(task.id, reminderId, type, endAt);
      // await ref.read(todoRepositoryProvider).reminderInsert(reminder);
      // await notifyService.scheduleNotification(
      //   reminderId,
      //   endAt,
      //   remindMinute,
      //   title,
      // );
      // ref.read(reminderNotifierProvider.notifier).addReminder(reminder);