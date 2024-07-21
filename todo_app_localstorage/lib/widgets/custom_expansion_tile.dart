import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_event.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/view/all_todos/todo_information_card.dart';

import '../bloc/create_update_delete_todo/create_todo_bloc.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: IconButton(
        onPressed: (){
          context.read<CreateTodoBloc>().add(CreateTodoEventOnUpdate(todo: todo,isCompleted: !todo.isCompleted));
          context.read<AllTodosBloc>().add(AllTodosEventFetch());
        },
        icon: todo.isCompleted ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      iconColor: Colors.blueAccent,
      title: Text(todo.title),
      subtitle:  Text(todo.description ?? todo.toBeCompletedByDate.toString(),maxLines: 1,),
      trailing: const SizedBox(),
      children: [
        TodoInformationCard(todo: todo),
      ],
    );
  }
}