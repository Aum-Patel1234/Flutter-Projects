import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/create_update_delete_todo/create_todo_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_bloc.dart';
import 'package:todo_app_localstorage/bloc/deleted_todos_bloc/deleted_todos_event.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_bloc.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_event.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_state.dart';
import 'package:todo_app_localstorage/view/all_todos/all_todos_body.dart';
import 'package:todo_app_localstorage/view/create_todo/create_todo_screen.dart';
import 'package:todo_app_localstorage/view/deleted_todos/deleted_todos_body.dart';
import 'package:todo_app_localstorage/view/statistics/todos_stats_body.dart';
import 'package:todo_app_localstorage/widgets/custom_search_delegate.dart';
import 'package:todo_app_localstorage/widgets/todo_filter_popup_menu.dart';

import '../bloc/deleted_todos_bloc/deleted_todos_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();

  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    context.read<AllTodosBloc>().add(AllTodosEventFetch());
    context.read<DeletedTodosBloc>().add(DeletedTodosEventFetchTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos App'),
        actions: [
          const TodoFileterPopUpMenu(),
          IconButton(
            onPressed: (){
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _navigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<AllTodosBloc>()),
                    BlocProvider(create:(context) => DateBloc(),),
                    BlocProvider(create:(context) => CreateTodoBloc(),),
                  ],
                  child: const CreateTodoScreen(),
                );
              }
            ),
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
      ),
    );
  }

  BlocBuilder<HomeScreenBloc, HomeScreenState> _navigationBar() {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list_alt_outlined),
              label: 'All Todos',
            ),
            NavigationDestination(
              icon: Icon(Icons.trending_up),
              label: 'Stats',
            ),
            NavigationDestination(
              icon: Icon(Icons.delete),
              label: 'Deleted',
            ),
          ],
          selectedIndex: state.index,
          onDestinationSelected: (index) {
            context.read<HomeScreenBloc>().add(HomeScreenEventChangeScreen(index: index));
            _pageController.jumpToPage(index);
          },
        );
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
      return PageView(
        onPageChanged: (value) {
          context.read<HomeScreenBloc>().add(HomeScreenEventChangeScreen(index: value));
        },
        controller: _pageController,
        children: [
          BlocProvider(
            create: (context) => CreateTodoBloc(),
            child: const AllTodosBody(),
          ),
          const TodosStatsBody(),
          BlocProvider(
            create: (context) => CreateTodoBloc(),
            child: const DeletedTodosBody(),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

