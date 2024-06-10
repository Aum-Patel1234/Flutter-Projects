import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/ContantsDisplayPage.dart';
import 'package:flutter_application_contactsapp/screens/Navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: Navigation.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        dialogBackgroundColor: Colors.grey[850],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const ContactDisplayPage(),
    );
  }
}

