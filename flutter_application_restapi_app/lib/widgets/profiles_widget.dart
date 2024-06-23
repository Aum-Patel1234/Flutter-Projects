import 'package:flutter/material.dart';
import 'package:flutter_application_restapi_app/bloc/user_bloc.dart';
import 'package:flutter_application_restapi_app/bloc/user_event.dart';
import 'package:flutter_application_restapi_app/bloc/user_state.dart';
import 'package:flutter_application_restapi_app/view/user_profile.dart';
import 'package:flutter_application_restapi_app/widgets/link_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is InitialState ) {
          return const Center(
              child: Text(
            'No Users !!',
            style: TextStyle(fontSize: 30),
          ));
        }
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: ()async{
                Navigator.push(context , MaterialPageRoute(builder: (context)=> const UserProfilePage()));
                context.read<UserBloc>().add(UserEventGetUserProfile(index: index));
              },
              child: ListTile(
                leading: const CircleAvatar(),
                title: Text(
                  state.users.elementAt(index).name,
                ),
                subtitle: Text(state.users.elementAt(index).username),
                trailing: LinkIcon(link: state.users[index].website),
              ),
            );
          },
        );
      },
    );
  }
}
