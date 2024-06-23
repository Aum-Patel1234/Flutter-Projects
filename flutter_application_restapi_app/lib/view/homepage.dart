import 'package:flutter/material.dart';
import 'package:flutter_application_restapi_app/bloc/user_bloc.dart';
import 'package:flutter_application_restapi_app/bloc/user_event.dart';
import 'package:flutter_application_restapi_app/theme/theme_bloc.dart';
import 'package:flutter_application_restapi_app/theme/theme_event.dart';
import 'package:flutter_application_restapi_app/theme/theme_state.dart';
import 'package:flutter_application_restapi_app/widgets/profiles_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profiles',
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return Switch(
              value: state.isDarkMode,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ChangedTheme());
              },
            );
          })
        ],
      ),
      body: const Profiles(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<UserBloc>().add(UserEventGetUsers());
        },
        child: const Icon(Icons.refresh,size: 30,),
      ),
    );
  }
}
