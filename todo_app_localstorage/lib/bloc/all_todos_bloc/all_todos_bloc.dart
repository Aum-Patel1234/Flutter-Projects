import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_state.dart';
import 'package:todo_app_localstorage/core/todo_local_database.dart';

class AllTodosBloc extends Bloc<AllTodosEvent,AllTodosState>{
  AllTodosBloc(): super(AllTodosState(isLoading: false,todos: [])){
    on<AllTodosEventFetch>(_onAllTodosEventFetch);
  }

  FutureOr<void> _onAllTodosEventFetch(AllTodosEventFetch event, Emitter<AllTodosState> emit) async{
    emit(AllTodosState(isLoading: true, todos: state.todos));
    final todos = await TodoLocalDatabase().getAllTodos();
    emit(AllTodosState(isLoading: false, todos: todos));
  }
} 
