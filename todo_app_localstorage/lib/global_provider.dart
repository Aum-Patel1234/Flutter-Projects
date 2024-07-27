import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_bloc.dart';

class GlobalProvider extends StatelessWidget{
  const GlobalProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AllTodosBloc()),
        BlocProvider(create: (context) => DeletedTodosBloc()),
      ],
      child: child,
    );
  }

}