import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_event.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_bloc.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_state.dart';
import 'package:todo_app_localstorage/view/create_todo/create_todo_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state.index == 2) {
          return FloatingActionButton(
            onPressed: () {
              context.read<DeletedTodosBloc>().add(DeletedTodosEventDeleteTodos());
            },
            backgroundColor: Colors.blueAccent,
            shape: const CircleBorder(),
            splashColor: Colors.lightBlueAccent,
            child: const Icon(
              Icons.delete,
              weight: 5,
              size: 30,
            ),
          );
        }

        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<AllTodosBloc>()),
                    BlocProvider(
                      create: (context) => DateBloc(),
                    ),
                    BlocProvider(
                      create: (context) => CreateTodoBloc(),
                    ),
                  ],
                  child: const CreateTodoScreen(),
                );
              }),
            );
          },
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
          splashColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            weight: 5,
            size: 30,
          ),
        );
      },
    );
  }
}
