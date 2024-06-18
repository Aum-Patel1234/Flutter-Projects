import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_bloc.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_state.dart';
import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_bloc.dart';
import 'package:flutter_application_timerapp/sceens/HomePage.dart';
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
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => ModeBloc()),
      ],
      child: BlocBuilder<ModeBloc, ModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.isDarkMode
                ? ThemeData.dark(
                    useMaterial3: true,
                  )
                : ThemeData.light(
                    useMaterial3: true,
                  ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
