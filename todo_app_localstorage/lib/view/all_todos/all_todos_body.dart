import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/view/all_todos/todo_information_card.dart';

class AllTodosBody extends StatelessWidget {
  const AllTodosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTodosBloc,AllTodosState>(
      builder: (context, state) {
        if(state.isLoading == true){
          return const CircularProgressIndicator.adaptive();
        }  
        if(state.todos.isNotEmpty){
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context,index){
              TodoModel todo = state.todos.elementAt(index);
              return ExpansionTile(
                leading: todo.isCompleted ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
                childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                iconColor: Colors.blueAccent,
                title: Text(todo.title),
                subtitle:  Text(todo.description ?? todo.toBeCompletedByDate.toString(),maxLines: 1,),
                trailing: const SizedBox(),
                children: [
                  TodoInformationCard(todo: todo),
                ],
              );
            },
          );
        }
        return const Center(child: Text('Add a todo'),);
      },
    );
  }
}