import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class DeletedTodosBody extends StatelessWidget {
  const DeletedTodosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletedTodosBloc,DeletedTodosState>(
      builder: (context, state) {
        if(!state.isLoading){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context,index){
            TodoModel todo  = state.todos.elementAt(index);
            return ListTile(
              title: Text(todo.title),
            );
          },
        );
      },
    );
  }
}