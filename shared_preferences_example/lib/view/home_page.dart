import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_bloc.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_bloc.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_event.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_state.dart';
import 'package:shared_preferences_example/core/share_preference.dart';
import 'package:shared_preferences_example/view/add_user_details.dart';
import 'package:shared_preferences_example/view/enums.dart';
import 'package:shared_preferences_example/widgets/custom_expansion_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UsersBloc>().add(UsersEventFetchAllUsers()); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Do You want to ',style: TextStyle(fontSize: 17)),
                          TextSpan(text: 'Delete all Users ? ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationThickness: 2)),
                        ]
                      ),
                    ),
                    actions: [
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      FilledButton.tonal(
                        onPressed: () {
                          clear();
                          Navigator.of(context).pop();
                          context.read<UsersBloc>().add(UsersEventFetchAllUsers());
                        },
                        child: const Text('Delete'),
                      )
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: BlocBuilder<UsersBloc,UsersState>(
        builder: (context,state){
          List<User> users = state.users;
          if(users.isEmpty){
            return const Center(child: Text('Add a User'),);
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              User user = users.elementAt(index);
              return CustomExpansionTile(index: index, user: user);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return BlocProvider(create: (context) => RadioButtonBloc(),child: const AddUserDetails(),);
            },
          ).then((value){
            context.read<UsersBloc>().add(UsersEventFetchAllUsers()); 
          });
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}