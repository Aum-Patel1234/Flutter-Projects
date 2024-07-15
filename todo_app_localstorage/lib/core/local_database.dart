import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._internal();
  factory LocalDatabase() {
    return _instance;
  }

  static final LocalDatabase _instance = LocalDatabase._internal();

  static const String tableName = 'Todos';

  late final Database database;

  Future<void> initalize() async {
    final localStoragePath = await getDatabasesPath();
    final String databasePath = '$localStoragePath/todo_database.db';

    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT,
            isCompleted INTEGER NOT NULL, 
            deletedAt INTEGER, 
            createdAt INTEGER NOT NULL,
            updatedAt INTEGER, 
            completedAt INTEGER,
            toBeCompletedByDate INTEGER NOT NULL,
            toBeCompletedByTime TEXT NOT NULL)''');
        log('database created - $db');
      },
    );
  }
}
