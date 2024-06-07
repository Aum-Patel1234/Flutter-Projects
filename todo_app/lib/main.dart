import 'package:flutter/material.dart';
import 'package:todo_app/screens/Navigation.dart';
import 'package:todo_app/widgets/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Navigation.generateRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      // home: const HomePage(),
    );
  }
}
