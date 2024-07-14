import 'package:todo_app_localstorage/model/todo_model.dart';

class AllTodosState {
  AllTodosState({required this.isLoading, required this.todos});

  final List<TodoModel> todos;
  final bool isLoading;
}
