import 'package:flutter_todo_application/domain/types/reminder.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/infrastructure/databases/todo_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) =>
    TodoRepository(ref.read(todoDaoProvider));

class TodoRepository {
  const TodoRepository(this._dao);

  final TodoDao _dao;

  Future<List<Task>> loadAll() async {
    return _dao.loadAll();
  }

  Future<void> insert(Task task) async {
    await _dao.insert(task);
  }

  Future<void> update(Task task) async {
    await _dao.update(task);
  }

  Future<void> progressUpdate(String id, int progress) async {
    await _dao.progressUpdate(id, progress);
  }

  Future<void> delete(String id) async {
    await _dao.delete(id);
  }

  Future<void> multiDelete(List<String> id) async {
    await _dao.multiDelete(id);
  }

  /*Future<List<Task>> search(String keyword) async {
    return _dao.search(keyword);
  }*/

  Future<List<SubTask>> subTaskLoadAll() async {
    return _dao.subTaskLoadAll();
  }

  Future<void> subTaskInsert(SubTask subTask) async {
    await _dao.subTaskInsert(subTask);
  }

  Future<void> subTaskUpdate(SubTask subTask) async {
    await _dao.subTaskUpdate(subTask);
  }

  Future<void> subtaskProgressUpdate(String id, int progress) async {
    await _dao.subTaskProgressUpdate(id, progress);
  }

  Future<void> subTaskDelete(String id) async {
    await _dao.subTaskDelete(id);
  }

  Future<void> multiSubTaskDelete(List<String> id) async {
    await _dao.multiSubTaskDelete(id);
  }

  Future<List<Tag>> tagLoadAll() async {
    return _dao.tagLoadAll();
  }

  Future<void> tagInsert(Tag tag) async {
    await _dao.tagInsert(tag);
  }

  Future<void> tagUpdate(Tag tag) async {
    await _dao.tagUpdate(tag);
  }

  Future<void> tagDelete(String id) async {
    await _dao.tagDelete(id);
  }

  Future<List<Reminder>> reminderLoadAll() async {
    return _dao.reminderLoadAll();
  }

  Future<void> reminderInsert(Reminder reminder) async {
    await _dao.reminderInsert(reminder);
  }

  Future<void> reminderUpdate(Reminder reminder) async {
    await _dao.reminderUpdate(reminder);
  }

  Future<void> reminderDelete(String id, int type) async {
    await _dao.reminderDelete(id, type);
  }

  Future<void> reminderMultiDelete(String taskId) async {
    await _dao.reminderMultiDelete(taskId);
  }
}
