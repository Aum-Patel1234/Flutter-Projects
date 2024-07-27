enum TodoStatus{
  initial,
  loading,
  completed,
}
class CreateTodoState {
  CreateTodoState({required this.todoStatus});

  final TodoStatus todoStatus;

  CreateTodoState copyWith({TodoStatus? todoStatus}) {
    return CreateTodoState(
      todoStatus: todoStatus ?? this.todoStatus,
    );
  }
}

