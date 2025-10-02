import 'package:flutter_todo_application/application/config/notification_service.dart';
import 'package:flutter_todo_application/application/state/reminder_notifier.dart';
import 'package:flutter_todo_application/application/state/sub_task_notifier.dart';
import 'package:flutter_todo_application/application/state/task_notifier.dart';
import 'package:flutter_todo_application/domain/types/reminder.dart';
import 'package:flutter_todo_application/domain/types/reminder_type.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_notifier.g.dart';

@riverpod
class EditNotifier extends _$EditNotifier {
  @override
  void build() {}

  Future<void> updateTask(Task task) async {
    final repository = ref.read(todoRepositoryProvider);
    final reminderNotifier = ref.read(reminderNotifierProvider.notifier);
    final notificationService = NotificationService();

    await repository.update(task);
    ref.read(taskNotifierProvider.notifier).updateTask(task);

    final reminders = reminderNotifier.getMultiReminder(task.id);

    final startReminderMinutes = task.startReminderMinutes;
    final endReminderMinutes = task.endReminderMinutes;

    if (startReminderMinutes == null && endReminderMinutes == null) {
      if (reminders.isEmpty) return;
      final reminderIds = reminders.map((r) => r.reminderId).toList();
      await repository.reminderMultiDelete(task.id);
      await notificationService.multiCancelNotifications(reminderIds);
      reminderNotifier.deleteAllReminder(task.id);
      return;
    }

    final now = DateTime.now();
    final startAt = task.startAt;
    final endAt = task.endAt;
    final startType = ReminderType.start.index;
    final endType = ReminderType.end.index;

    if (startReminderMinutes != null &&
        startAt != null &&
        startAt.isAfter(now)) {
      final reminderIndex = reminders.indexWhere((r) => r.type == startType);
      if (reminderIndex != -1) {
        final updatedReminder = reminders[reminderIndex].copyWith(
          scheduleAt: startAt,
        );
        await _updateReminder(
          updatedReminder,
          startType,
          startAt,
          startReminderMinutes,
          task.title,
        );
      } else {
        await _createReminder(
          startAt,
          startType,
          task.id,
          startReminderMinutes,
          task.title,
        );
      }
    } else {
      final reminderIndex = reminders.indexWhere((r) => r.type == startType);
      if (reminderIndex != -1) {
        final reminderId = reminders[reminderIndex].reminderId;
        await _deleteReminder(reminderId, task.id, startType);
      }
    }

    if (endReminderMinutes != null && endAt != null && endAt.isAfter(now)) {
      final reminderIndex = reminders.indexWhere((r) => r.type == endType);
      if (reminderIndex != -1) {
        final updatedReminder = reminders[reminderIndex].copyWith(
          scheduleAt: endAt,
        );
        await _updateReminder(
          updatedReminder,
          endType,
          endAt,
          endReminderMinutes,
          task.title,
        );
      } else {
        await _createReminder(
          endAt,
          endType,
          task.id,
          endReminderMinutes,
          task.title,
        );
      }
    } else {
      final reminderIndex = reminders.indexWhere((r) => r.type == endType);
      if (reminderIndex != -1) {
        final reminderId = reminders[reminderIndex].reminderId;
        await _deleteReminder(reminderId, task.id, endType);
      }
    }
  }

  Future<void> deleteTask(String id) async {
    await ref.read(todoRepositoryProvider).delete(id);
    ref.read(taskNotifierProvider.notifier).deleteTask(id);

    final reminderNotifier = ref.read(reminderNotifierProvider.notifier);
    final reminders = reminderNotifier.getMultiReminder(id);

    if (reminders.isEmpty) return;

    final reminderIds = reminders.map((r) => r.reminderId).toList();
    await NotificationService().multiCancelNotifications(reminderIds);
    reminderNotifier.deleteAllReminder(id);
  }

  Future<void> createSubTask(String taskId, String title) async {
    final subTask = SubTask.create(taskId, title);
    await ref.read(todoRepositoryProvider).subTaskInsert(subTask);
    ref.read(subTaskNotifierProvider.notifier).addSubTask(subTask);
  }

  Future<void> updateSubTask(SubTask subTask) async {
    await ref.read(todoRepositoryProvider).subTaskUpdate(subTask);
    ref.read(subTaskNotifierProvider.notifier).updateSubTask(subTask);
  }

  Future<void> deleteSubTask(String subId) async {
    await ref.read(todoRepositoryProvider).subTaskDelete(subId);
    ref.read(subTaskNotifierProvider.notifier).deleteSubTask(subId);
  }

  int _getRemindIdNumber(int suffix) {
    return DateTime.now().millisecondsSinceEpoch * 10 + suffix;
  }

  Future<void> _updateReminder(
    Reminder reminder,
    int type,
    DateTime scheduleAt,
    int remindMinute,
    String title,
  ) async {
    ref.read(reminderNotifierProvider.notifier).upsertReminder(reminder);
    await ref.read(todoRepositoryProvider).reminderUpdate(reminder);
    await NotificationService().scheduleNotification(
      reminder.reminderId,
      scheduleAt,
      remindMinute,
      title,
    );
  }

  Future<void> _createReminder(
    DateTime scheduleAt,
    int type,
    String taskId,
    int remindMinute,
    String title,
  ) async {
    final reminderId = _getRemindIdNumber(type);
    final updatedReminder = Reminder.create(
      taskId,
      reminderId,
      type,
      scheduleAt,
    );
    ref.read(reminderNotifierProvider.notifier).upsertReminder(updatedReminder);
    await ref.read(todoRepositoryProvider).reminderInsert(updatedReminder);
    await NotificationService().scheduleNotification(
      reminderId,
      scheduleAt,
      remindMinute,
      title,
    );
  }

  Future<void> _deleteReminder(int reminderId, String taskId, int type) async {
    ref.read(reminderNotifierProvider.notifier).deleteReminder(taskId, type);
    await NotificationService().cancelNotifications(reminderId);
    ref.read(todoRepositoryProvider).reminderDelete(taskId, type);
  }
}
