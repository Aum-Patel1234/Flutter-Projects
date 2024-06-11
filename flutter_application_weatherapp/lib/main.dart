import 'package:flutter/material.dart';
import 'package:flutter_application_weatherapp/bloc/weather_bloc.dart';
import 'package:flutter_application_weatherapp/screens/weather_page.dart';
import 'package:flutter_application_weatherapp/weatherconnection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  get();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        title: 'Weather App Demo',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: WeatherPage(),
      ),
    );
  }
}
