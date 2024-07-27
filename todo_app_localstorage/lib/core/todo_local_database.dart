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
  final String _deletedtableName = LocalDatabase.deletedTableName;

  Future<void> add(TodoModel todoModel) async {
    int id = await _localDatabase.database.insert(
      _tableName,
      todoModel.toMap(),
    );
    log('Todo id - $id');
  }

  Future<List<TodoModel>> getAllTodos({String query = ''}) async {
    final response = await _localDatabase.database.rawQuery(
      '''
      SELECT * FROM $_tableName WHERE title LIKE '%$query%'
      '''
    //   '''
    // SELECT * FROM $_tableName WHERE title LIKE ?
    // ''',
    // ['%$query%']
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
  Future<void> deleteTodo(TodoModel todo,) async {
    await _localDatabase.database.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  /*
  ***********************************************************************************
                      Deleted todos database management 
  ***********************************************************************************
   */

  Future<void> insertIntoDeletedTodos(TodoModel todo)async{
    int id = await _localDatabase.database.insert(
      _deletedtableName,
      todo.toMap(),
    );
    log('dddd - $id');
  }
  Future<void> deleteFromDeletedTodos(TodoModel todo)async{
    await _localDatabase.database.delete(
      _deletedtableName,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
  Future<List<TodoModel>> getAllDeletedTodos() async {
    final response = await _localDatabase.database.rawQuery(
      '''
      SELECT * FROM $_deletedtableName
      '''
    );
    log(response.toString());
    return response.map((map) => TodoModel.fromMap(map)).toList(); 
  }
}
