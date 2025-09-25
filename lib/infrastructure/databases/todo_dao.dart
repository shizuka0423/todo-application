import 'package:flutter_todo_application/domain/types/reminder.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/infrastructure/databases/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'todo_dao.g.dart';

@riverpod
TodoDao todoDao(TodoDaoRef ref) => TodoDao(ref.read(appDatabaseProvider));

class TodoDao {
  const TodoDao(this._database);

  final AppDatabase _database;

  Future<List<Task>> loadAll() async {
    final db = await _database.db;
    final data = await db.query('tasks', orderBy: 'updated_at DESC');
    return data.isEmpty ? [] : data.map((e) => Task.fromJson(e)).toList();
  }

  /*Future<List<Task>> search(String keyword) async {
    final db = await _database.db;
    final data = await db.query(
      'Memos',
      where: 'title LIKE ?',
      whereArgs: ['%$keyword%'],
      orderBy: 'updated_at DESC',
    );
    return data.isEmpty ? [] : data.map((e) => Task.fromJson(e)).toList();
  }*/

  Future<void> insert(Task task) async {
    final db = await _database.db;
    await db.insert('tasks', task.toJson());
  }

  Future<void> update(Task task) async {
    final db = await _database.db;
    await db.update(
      'tasks',
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> progressUpdate(String id, int progress) async {
    final db = await _database.db;
    await db.update(
      'tasks',
      {'progress': progress},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _database.db;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> multiDelete(List<String> id) async {
    final db = await _database.db;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  //subTaskの処理
  Future<List<SubTask>> subTaskLoadAll() async {
    final db = await _database.db;
    final data = await db.query('subtasks', orderBy: 'id ASC');
    return data.isEmpty ? [] : data.map((e) => SubTask.fromJson(e)).toList();
  }

  Future<void> subTaskInsert(SubTask subTask) async {
    final db = await _database.db;
    await db.insert('subtasks', subTask.toJson());
  }

  Future<void> subTaskUpdate(SubTask subTask) async {
    final db = await _database.db;
    await db.update(
      'subtasks',
      subTask.toJson(),
      where: 'id = ?',
      whereArgs: [subTask.id],
    );
  }

  Future<void> subTaskProgressUpdate(String id, int progress) async {
    final db = await _database.db;
    await db.update(
      'subtasks',
      {'progress': progress},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> subTaskDelete(String id) async {
    final db = await _database.db;
    await db.delete('subtasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> multiSubTaskDelete(List<String> id) async {
    final db = await _database.db;
    await db.delete('subtasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Tag>> tagLoadAll() async {
    final db = await _database.db;
    final data = await db.query('tags', orderBy: 'id ASC');
    return data.isEmpty ? [] : data.map((e) => Tag.fromJson(e)).toList();
  }

  Future<void> tagInsert(Tag tag) async {
    final db = await _database.db;
    await db.insert('tags', tag.toJson());
  }

  Future<void> tagUpdate(Tag tag) async {
    final db = await _database.db;
    await db.update('tags', tag.toJson(), where: 'id = ?', whereArgs: [tag.id]);
  }

  Future<void> tagDelete(String id) async {
    final db = await _database.db;
    await db.delete('tags', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Reminder>> reminderLoadAll() async {
    final db = await _database.db;
    final data = await db.query('reminders', orderBy: 'task_id ASC, type ASC');
    return data.isEmpty ? [] : data.map((e) => Reminder.fromJson(e)).toList();
  }

  Future<void> reminderInsert(Reminder reminder) async {
    final db = await _database.db;
    await db.insert('reminders', reminder.toJson());
  }

  Future<void> reminderUpdate(Reminder reminder) async {
    final db = await _database.db;
    await db.update(
      'reminders',
      reminder.toJson(),
      where: 'task_id = ? AND type = ?',
      whereArgs: [reminder.taskId, reminder.type],
    );
  }

  Future<void> reminderDelete(String taskId, int type) async {
    final db = await _database.db;
    await db.delete(
      'reminders',
      where: 'task_id = ? AND type = ?',
      whereArgs: [taskId, type],
    );
  }

  Future<void> reminderMultiDelete(String taskId) async {
    final db = await _database.db;
    await db.delete('reminders', where: 'task_id = ?', whereArgs: [taskId]);
  }

  /*Future<void> insert(Task task) async {
    final db = await _database.db;
    await db.insert('Memos', task.toJson());
  }*/
}
