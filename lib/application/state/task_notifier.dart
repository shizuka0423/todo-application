import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_notifier.g.dart';

@riverpod
class TaskNotifier extends _$TaskNotifier {
  @override
  List<Task> build() => [];

  Future<void> loadAllTask() async {
    state = await ref.read(todoRepositoryProvider).loadAll();
  }

  void addTask(Task task) => state = <Task>[task, ...state];

  void updateTask(Task task) =>
      state = state.map((t) => (t.id == task.id) ? task : t).toList();

  void resetTagId(String deletedTagId) =>
      state =
          state
              .map(
                (t) => (t.tagId == deletedTagId) ? t.copyWith(tagId: null) : t,
              )
              .toList();

  void deleteTask(String id) => state = state.where((t) => t.id != id).toList();

  void sortTask() {
    //state = state.sort();
  }

  void updateProgress(String taskId, int taskProgress) {
    final index = state.indexWhere((t) => t.id == taskId);
    if (index == -1) return;

    final updatedTask = state[index].copyWith(progress: taskProgress);
    final updatedList = [...state];

    updatedList[index] = updatedTask;
    state = updatedList;
  }

  // Memoを検索する
  /*Future<void> searchTask(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _todoRepository.search(keyword);
    });
  }*/
}
