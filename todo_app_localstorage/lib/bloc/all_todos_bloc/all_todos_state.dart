import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/widgets/enums.dart';

class AllTodosState {
  AllTodosState({required this.isLoading, required this.todos,this.todoFilter = TodoFilter.all});

  final List<TodoModel> todos;
  final bool isLoading;
  final TodoFilter todoFilter;
}
