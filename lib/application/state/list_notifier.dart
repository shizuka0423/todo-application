import 'package:flutter_todo_application/application/config/notification_service.dart';
import 'package:flutter_todo_application/application/state/reminder_notifier.dart';
import 'package:flutter_todo_application/application/state/tag_notifier.dart';
import 'package:flutter_todo_application/application/state/task_notifier.dart';
import 'package:flutter_todo_application/domain/types/reminder_type.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_notifier.g.dart';

@riverpod
class ListNotifier extends _$ListNotifier {
  @override
  void build() {}

  Future<void> updateProgress(Task task, int updatedProgress) async {
    await ref
        .read(todoRepositoryProvider)
        .progressUpdate(task.id, updatedProgress);
    ref
        .read(taskNotifierProvider.notifier)
        .updateProgress(task.id, updatedProgress);

    if (task.remindMinute == null) return;
    final remindMinute = task.remindMinute!;

    final notificationService = NotificationService();
    final reminders = ref
        .read(reminderNotifierProvider.notifier)
        .getMultiReminder(task.id);

    if (reminders.isEmpty) return;

    if (updatedProgress == 0) {
      final reminderIds = reminders.map((r) => r.reminderId).toList();
      await notificationService.multiCancelNotifications(reminderIds);
      // if (task.startAt != null) {
      //   final type = ReminderType.start.index;
      //   final reminder = reminders.firstWhere((r) => type == r.type);
      //   notificationService.cancelNotifications(reminder.reminderId);
      // }
      // if (task.endAt != null) {
      //   final type = ReminderType.end.index;
      //   final reminder = reminders.firstWhere((r) => type == r.type);
      //   notificationService.cancelNotifications(reminder.reminderId);
      // }
    } else {
      final now = DateTime.now();
      for (final reminder in reminders) {
        if (reminder.scheduleAt.isAfter(now)) {
          await notificationService.scheduleNotification(
            reminder.reminderId,
            reminder.scheduleAt,
            remindMinute,
            task.title,
          );
        }
      }

      // if (task.startAt != null) {
      //   final type = ReminderType.start.index;
      //   final reminder = reminders.firstWhere((r) => type == r.type);
      //   await notificationService.scheduleNotification(
      //     reminder.reminderId,
      //     reminder.scheduleAt,
      //     task.remindMinute!,
      //     task.title,
      //   );
      // }
      // if (task.endAt != null) {
      //   final type = ReminderType.end.index;
      //   final reminder = reminders.firstWhere((r) => type == r.type);
      //   await notificationService.scheduleNotification(
      //     reminder.reminderId,
      //     reminder.scheduleAt,
      //     task.remindMinute!,
      //     task.title,
      //   );
      // }
    }
  }

  Future<void> createTag(String name, int color, int favorite) async {
    final tag = Tag.create(name, color, favorite);
    await ref.read(todoRepositoryProvider).tagInsert(tag);
    ref.read(tagNotifierProvider.notifier).addTag(tag);
  }

  Future<void> updateTag(Tag tag) async {
    await ref.read(todoRepositoryProvider).tagUpdate(tag);
    ref.read(tagNotifierProvider.notifier).updateTag(tag);
  }

  //taskのstateを編集する処理もいれる
  Future<void> deleteTag(String id) async {
    await ref.read(todoRepositoryProvider).tagDelete(id);
    ref.read(tagNotifierProvider.notifier).deleteTag(id);
    ref.read(taskNotifierProvider.notifier).resetTagId(id);
  }
}
