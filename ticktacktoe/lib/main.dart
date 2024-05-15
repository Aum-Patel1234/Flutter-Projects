import 'package:flutter/material.dart';
import 'package:ticktacktoe/screens/HomePage.dart';
import 'package:ticktacktoe/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const HomePage(),
      
    );
  }
}


