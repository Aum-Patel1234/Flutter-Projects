
import 'package:flutter/material.dart';

class TodoFileterPopUpMenu extends StatelessWidget {
  const TodoFileterPopUpMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return <PopupMenuItem<TodoFilter>>[
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.all,
            child: const Text('All Todos'),
            onTap: (){

            },
          ),
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.completed,
            child: const Text('Completed'),
            onTap: (){

            },
          ),
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.incomplete,
            child: const Text('Not Completed'),
            onTap: (){

            },
          ),
        ];
      },
    );
  }
}

enum TodoFilter{
  all,
  completed,
  incomplete;
}