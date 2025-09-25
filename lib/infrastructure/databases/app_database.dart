import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'app_database.g.dart';

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) => AppDatabase();

class AppDatabase {
  Database? _db;

  Future<Database> get db async {
    //final path = join(await getDatabasesPath(), 'todo.db');
    //await deleteDatabase(path);

    debugPrint("dbが呼び出されました");
    if (_db != null) {
      return _db!;
    } else {
      debugPrint("dbがopenされました");
      _db = await _init();

      return _db!;
    }
  }

  final queries = [
    [
      '''CREATE TABLE tasks(
      id TEXT PRIMARY KEY,
      title TEXT,
      description TEXT,
      tag_id TEXT,
      importance INTEGER,
      progress INTEGER,
      regularly INTEGER,
      repeat_count INTEGER,
      start_at TEXt,
      end_at TEXT,
      remind_minute INTEGER,
      created_at TEXT,
      updated_at TEXT,
      FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE SET NULL
      )''',
    ],
    [
      '''CREATE TABLE tags(
      id TEXT PRIMARY KEY,
      name TEXT,
      color INTEGER,
      favorite INTEGER
      )''',
    ],
    [
      '''CREATE TABLE subtasks(
      id TEXT PRIMARY KEY,
      task_id TEXT,
      title TEXT,
      progress INTEGER,
      FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
      )''',
    ],
    [
      '''CREATE TABLE reminders(
      task_id TEXT,
      reminder_id INTEGER,
      type INTEGER,
      schedule_at TEXT,
      PRIMARY KEY (task_id, type),
      FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
      )''',
    ],
  ];

  Future<Database> _init() async {
    final path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(
      path,
      version: queries.length,
      onCreate: (db, version) async {
        for (final queryList in queries) {
          for (final query in queryList) {
            await db.execute(query);
            debugPrint("テーブルが生成されました");
          }
        }
      },
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON;'),
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion; i < newVersion; i++) {
          for (final query in queries[i]) {
            await db.execute(query);
          }
        }
      },
    );
  }
}
