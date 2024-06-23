import 'package:flutter/material.dart';
import 'package:flutter_application_restapi_app/bloc/user_bloc.dart';
import 'package:flutter_application_restapi_app/theme/theme_bloc.dart';
import 'package:flutter_application_restapi_app/theme/theme_state.dart';
import 'package:flutter_application_restapi_app/view/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: state.isDarkMode
              ? ThemeData.dark(
                  useMaterial3: true,
                )
              : ThemeData.light(
                  useMaterial3: true,
                ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
