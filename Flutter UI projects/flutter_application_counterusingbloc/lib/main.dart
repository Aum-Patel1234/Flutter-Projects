import 'package:flutter/material.dart';
import 'package:flutter_application_counterusingbloc/bloc/counter_bloc.dart';
import 'package:flutter_application_counterusingbloc/cubit/CounterCubit.dart';
import 'package:flutter_application_counterusingbloc/screens/MyHomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.black54,
          useMaterial3: true,
        ),
        
        home: MyHomePage(),
      ),
    );
  }
}
