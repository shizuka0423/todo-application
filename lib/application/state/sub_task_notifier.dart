import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_task_notifier.g.dart';

@riverpod
class SubTaskNotifier extends _$SubTaskNotifier {
  @override
  List<SubTask> build() => [];

  Future<void> loadSubTask(String taskId) async {
    final all = await ref.read(todoRepositoryProvider).subTaskLoadAll();
    state = all.where((e) => e.taskId == taskId).toList();
  }

  void addSubTask(SubTask subTask) => state = <SubTask>[subTask, ...state];

  void updateSubTask(SubTask subTask) =>
      state = state.map((s) => (s.id == subTask.id) ? subTask : s).toList();

  void deleteSubTask(String id) =>
      state = state.where((s) => s.id != id).toList();
}
