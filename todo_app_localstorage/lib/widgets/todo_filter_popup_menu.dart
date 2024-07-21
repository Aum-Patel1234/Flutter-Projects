import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/widgets/enums.dart';

class TodoFileterPopUpMenu extends StatelessWidget {
  const TodoFileterPopUpMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodoFilter>(
      onSelected: (TodoFilter filter) {
        context.read<AllTodosBloc>().add(AllTodosEventFilter(todoFilter: filter));
      },
      itemBuilder: (context) {
        return <PopupMenuItem<TodoFilter>>[
          const PopupMenuItem<TodoFilter>(
            value: TodoFilter.all,
            child: Text('All Todos'),
          ),
          const PopupMenuItem<TodoFilter>(
            value: TodoFilter.completed,
            child: Text('Completed'),
          ),
          const PopupMenuItem<TodoFilter>(
            value: TodoFilter.incomplete,
            child: Text('Not Completed'),
          ),
        ];
      },
    );
  }
}
