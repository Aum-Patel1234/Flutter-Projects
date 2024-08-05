import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('email'),
            accountName: Text('name'),
          ),
          Text('data'),
          Text('data'),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              context.read<AuthBloc>().add(AuthEventLogout());
              Navigator.of(context).pop();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
