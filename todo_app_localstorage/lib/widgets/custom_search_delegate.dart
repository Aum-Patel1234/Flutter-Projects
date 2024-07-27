import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_bloc.dart';
import 'package:todo_app_localstorage/view/all_todos/all_todos_body.dart';

class CustomSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        context.read<AllTodosBloc>().add(AllTodosEventFetch());  // to rebuild all the 
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const AllTodosBody();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<AllTodosBloc>().add(AllTodosEventFetch(query: query));
    return BlocProvider(
      create: (context) => CreateTodoBloc(),
      child: const AllTodosBody(),
    );
  }
}