import 'package:flutter_todo_application/domain/types/reminder.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_notifier.g.dart';

@riverpod
class ReminderNotifier extends _$ReminderNotifier {
  @override
  List<Reminder> build() => [];

  Future<void> loadAllReminder() async {
    state = await ref.read(todoRepositoryProvider).reminderLoadAll();
  }

  List<Reminder> getMultiReminder(String taskId) =>
      state.where((r) => r.taskId == taskId).toList();

  //void addReminder(Reminder reminder) => state = <Reminder>[...state, reminder];

  void upsertReminder(Reminder reminder) {
    final index = state.indexWhere(
      (r) => r.taskId == reminder.taskId && r.type == reminder.type,
    );

    if (index == -1) {
      state = <Reminder>[...state, reminder];
    } else {
      final updatedList = <Reminder>[...state];
      updatedList[index] = reminder;
      state = updatedList;
    }
  }

  void deleteReminder(String taskId, int type) =>
      state = state.where((r) => r.taskId != taskId || r.type != type).toList();

  void deleteAllReminder(String taskId) =>
      state = state.where((r) => r.taskId != taskId).toList();
}
