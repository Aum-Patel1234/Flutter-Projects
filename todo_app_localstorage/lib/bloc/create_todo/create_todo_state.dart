enum TodoStatus{
  initial,
  loading,
  completed,
}
class CreateTodoState{
  CreateTodoState({required this.todoStatus});
  
  final TodoStatus todoStatus;
}
