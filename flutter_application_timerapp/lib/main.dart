import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/timer_bloc.dart';
import 'package:flutter_application_timerapp/sceens/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          dialogBackgroundColor: Colors.purpleAccent,
        ),
        home: const HomePage(),
      ),
    );
  }
}
