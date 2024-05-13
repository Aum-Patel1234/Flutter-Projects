import 'package:flutter/material.dart';
import 'package:flutter_application_art/screens/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  const MyHomePage(),
      darkTheme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.black),
    );
  }
  
}