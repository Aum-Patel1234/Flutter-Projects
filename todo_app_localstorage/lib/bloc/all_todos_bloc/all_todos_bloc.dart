import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_state.dart';
import 'package:todo_app_localstorage/core/todo_local_database.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class AllTodosBloc extends Bloc<AllTodosEvent,AllTodosState>{
  AllTodosBloc(): super(AllTodosState(isLoading: false,todos: [])){
    on<AllTodosEventFetch>(_onAllTodosEventFetch);
    on<AllTodosEventFilter>(_onAllTodosEventFilter);
  }

  FutureOr<void> _onAllTodosEventFetch(AllTodosEventFetch event, Emitter<AllTodosState> emit) async{
    emit(AllTodosState(isLoading: true, todos: state.todos,todoFilter: state.todoFilter));
    final List<TodoModel> todos = await TodoLocalDatabase().getAllTodos(query: event.query);
    emit(AllTodosState(isLoading: false, todos: todos,todoFilter: state.todoFilter));
  }

  FutureOr<void> _onAllTodosEventFilter(AllTodosEventFilter event, Emitter<AllTodosState> emit) {
    emit(AllTodosState(isLoading: false, todos: state.todos,todoFilter: event.todoFilter));
  }
} 
