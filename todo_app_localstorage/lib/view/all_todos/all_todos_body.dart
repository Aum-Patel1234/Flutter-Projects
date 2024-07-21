import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/widgets/custom_expansion_tile.dart';
import 'package:todo_app_localstorage/widgets/enums.dart';

class AllTodosBody extends StatelessWidget {
  const AllTodosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTodosBloc, AllTodosState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        List<TodoModel> filteredTodos = state.todos;

        if (state.todoFilter == TodoFilter.completed) {
          filteredTodos = state.todos.where((todo) => todo.isCompleted).toList();
        } else if (state.todoFilter == TodoFilter.incomplete) {
          filteredTodos = state.todos.where((todo) => !todo.isCompleted).toList();
        }

        if (filteredTodos.isEmpty) {
          return const Center(child: Text('Add a todo'));
        }

        return ListView.builder(
          itemCount: filteredTodos.length,
          itemBuilder: (context, index) {
            TodoModel todo = filteredTodos[index];
            return CustomExpansionTile(todo: todo);
          },
        );
      },
    );
  }
}
