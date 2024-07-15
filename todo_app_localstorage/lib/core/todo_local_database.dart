import 'dart:developer';

import 'package:todo_app_localstorage/core/local_database.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class TodoLocalDatabase {
  TodoLocalDatabase._();
  static final TodoLocalDatabase _instance = TodoLocalDatabase._();
  factory TodoLocalDatabase() {
    return _instance;
  }

  final LocalDatabase _localDatabase = LocalDatabase();
  final String _tableName = LocalDatabase.tableName;

  Future<void> add(TodoModel todoModel) async {
    int id = await _localDatabase.database.insert(
      _tableName,
      todoModel.toMap(),
    );
    log('Todo id - $id');
  }

  Future<List<TodoModel>> getAllTodos() async {
    final response = await _localDatabase.database.rawQuery(
      'SELECT * FROM $_tableName'
    );
    return response.map((map) => TodoModel.fromMap(map)).toList(); 
  }

  Future<void> updateTodo(TodoModel todo,) async {
    await _localDatabase.database.update(
      _tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
