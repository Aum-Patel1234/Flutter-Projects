import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

class DeletedTodosBody extends StatelessWidget {
  const DeletedTodosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletedTodosBloc, DeletedTodosState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            TodoModel todo = state.todos.elementAt(index);

            return ListTile(
              title: Text(todo.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Due: ${todo.toBeCompletedByDate.toLocal().toString().split(' ')[0]} at ${todo.toBeCompletedByTime.format(context)}',
                  ),
                  if (todo.isCompleted)
                    const Text(
                      'Completed',
                      style: TextStyle(color: Colors.green),
                    ),
                ],
              ),
              trailing: Icon(
                todo.isCompleted ? Icons.check_circle : Icons.circle,
                color: todo.isCompleted ? Colors.green : Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}

// self, presentation , goal