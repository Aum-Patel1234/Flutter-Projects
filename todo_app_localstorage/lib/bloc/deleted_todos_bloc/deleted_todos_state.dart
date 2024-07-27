import 'package:todo_app_localstorage/model/todo_model.dart';

class DeletedTodosState {
  final List<TodoModel> todos;
  final bool isLoading;

  DeletedTodosState({
    required this.todos,
    required this.isLoading,
  });

  DeletedTodosState copyWith({
    List<TodoModel>? todos,
    bool? isLoading,
  }) {
    return DeletedTodosState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
