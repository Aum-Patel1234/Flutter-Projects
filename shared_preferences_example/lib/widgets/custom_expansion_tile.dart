import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_bloc.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_bloc.dart';
import 'package:shared_preferences_example/bloc/users_bloc/users_event.dart';
import 'package:shared_preferences_example/core/share_preference.dart';
import 'package:shared_preferences_example/view/add_user_details.dart';
import '../view/enums.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key, required this.index, required this.user});

  final int index;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: IconButton(
        onPressed: () {
          deleteUser(index);
          context.read<UsersBloc>().add(UsersEventFetchAllUsers());
        },
        icon: const Icon(Icons.delete),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      _buildUserInfoRow(Icons.phone, 'Phone Number', user.phoneNumber.toString()),
                      _buildUserInfoRow(Icons.cake, 'Age', user.age.toString()),
                      _buildUserInfoRow(user.isMarried ?Icons.people : Icons.person, 'Marital Status',user.isMarried ? 'Married' : 'Single'),
                    ],
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color : Colors.deepPurple,
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BlocProvider(create: (context) => RadioButtonBloc(),child: AddUserDetails(user: user,index: index),);
                            },
                          ).then((value){
                            context.read<UsersBloc>().add(UsersEventFetchAllUsers()); 
                          });
                        },
                        icon: const Icon(Icons.edit,),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
