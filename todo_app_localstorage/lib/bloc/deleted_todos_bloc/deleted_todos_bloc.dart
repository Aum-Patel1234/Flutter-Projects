import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_event.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_state.dart';
import 'package:todo_app_localstorage/core/todo_local_database.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class DeletedTodosBloc extends Bloc<DeletedTodosEvent, DeletedTodosState> {
  DeletedTodosBloc() : super(DeletedTodosState(todos: [], isLoading: false)) {
    on<DeletedTodosEventFetchTodos>(_onDeletedTodosEventFetchTodos);
    on<DeletedTodosEventDeleteTodos>(_onDeletedTodosEventDeleteTodos);
  }

  FutureOr<void> _onDeletedTodosEventFetchTodos(DeletedTodosEventFetchTodos event, Emitter<DeletedTodosState> emit) async {
    // Emit loading state
    emit(state.copyWith(isLoading: true));
    
    final List<TodoModel> todos = await TodoLocalDatabase().getAllDeletedTodos();
    
    // Emit completed state with fetched todos
    emit(state.copyWith(todos: todos, isLoading: false));
  }

  FutureOr<void> _onDeletedTodosEventDeleteTodos(DeletedTodosEventDeleteTodos event, Emitter<DeletedTodosState> emit) {
    // Handle delete event if needed
  }
}
