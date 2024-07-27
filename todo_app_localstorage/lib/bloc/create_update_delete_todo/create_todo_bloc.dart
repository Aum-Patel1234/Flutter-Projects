import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_event.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_state.dart';
import 'package:todo_app_localstorage/core/todo_local_database.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc() : super(CreateTodoState(todoStatus: TodoStatus.initial)) {
    on<CreateTodoEventOnCreate>(_onCreateTodoEventOnCreate);
    on<CreateTodoEventOnUpdate>(_onCreateTodoEventOnUpdate);
    on<CreateTodoEventOnDelete>(_onCreateTodoEventOnDelete);
  }

  FutureOr<void> _onCreateTodoEventOnCreate(CreateTodoEventOnCreate event, Emitter<CreateTodoState> emit) async {
    // Emit loading state
    emit(state.copyWith(todoStatus: TodoStatus.loading));

    final TodoModel todoModel = TodoModel(
      title: event.title,
      description: event.description,
      toBeCompletedByDate: event.toBeCompletedByDate,
      toBeCompletedByTime: event.toBeCompletedByTime,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    await TodoLocalDatabase().add(todoModel);

    // Emit completed state
    emit(state.copyWith(todoStatus: TodoStatus.completed));
  }

  FutureOr<void> _onCreateTodoEventOnUpdate(CreateTodoEventOnUpdate event, Emitter<CreateTodoState> emit) async {
    // Emit loading state
    emit(state.copyWith(todoStatus: TodoStatus.loading));

    await TodoLocalDatabase().updateTodo(
      event.todo.copyWith(updatedAt: DateTime.now(), isCompleted: event.isCompleted, completedAt: DateTime.now())
    );

    // Emit completed state
    emit(state.copyWith(todoStatus: TodoStatus.completed));
  }

  FutureOr<void> _onCreateTodoEventOnDelete(CreateTodoEventOnDelete event, Emitter<CreateTodoState> emit) async {
    // Emit loading state
    emit(state.copyWith(todoStatus: TodoStatus.loading));

    await TodoLocalDatabase().insertIntoDeletedTodos(event.todo);
    await TodoLocalDatabase().deleteTodo(
      event.todo
    );

    // Emit completed state
    emit(state.copyWith(todoStatus: TodoStatus.completed));
  }
}


// class CreateTodoBloc extends Bloc<CreateTodoEvent,CreateTodoState>{
//   CreateTodoBloc():super(CreateTodoState(todoStatus: TodoStatus.initial)){
//     on<CreateTodoEventOnCreate>(_onCreateTodoEventOnCreate);
//     on<CreateTodoEventOnUpdate>(_onCreateTodoEventOnUpdate);
//     on<CreateTodoEventOnDelete>(_onCreateTodoEventOnDelete);
//   }

//   FutureOr<void> _onCreateTodoEventOnCreate(CreateTodoEventOnCreate event, Emitter<CreateTodoState> emit) async{
//     emit(CreateTodoState(todoStatus: TodoStatus.loading));

//     final TodoModel todoModel = TodoModel(
//       title: event.title,
//       description: event.description,
//       toBeCompletedByDate: event.toBeCompletedByDate,
//       toBeCompletedByTime: event.toBeCompletedByTime,
//       isCompleted: false,
//       createdAt: DateTime.now(),
//     );
    
//     await TodoLocalDatabase().add(todoModel);

//     emit(CreateTodoState(todoStatus: TodoStatus.completed));
//   }

//   FutureOr<void> _onCreateTodoEventOnUpdate(CreateTodoEventOnUpdate event, Emitter<CreateTodoState> emit) async{
//     emit(CreateTodoState(todoStatus: TodoStatus.loading));
    
//     await TodoLocalDatabase().updateTodo(
//       event.todo.copyWith(updatedAt: DateTime.now(),isCompleted: event.isCompleted,completedAt: DateTime.now())
//     );

//     emit(CreateTodoState(todoStatus: TodoStatus.completed));
//   }

//   FutureOr<void> _onCreateTodoEventOnDelete(CreateTodoEventOnDelete event, Emitter<CreateTodoState> emit) async{
//     emit(CreateTodoState(todoStatus: TodoStatus.loading));
    
//     await TodoLocalDatabase().insertIntoDeletedTodos(event.todo);
//     await TodoLocalDatabase().deleteTodo(
//       // event.todo.copyWith(deletedAt: DateTime.now())
//       event.todo
//     );

//     emit(CreateTodoState(todoStatus: TodoStatus.completed));
//   }
// }