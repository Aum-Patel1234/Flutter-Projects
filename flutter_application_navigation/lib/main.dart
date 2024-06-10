import 'package:flutter/material.dart';
import 'package:flutter_application_navigation/screens/MyHomepage.dart';


void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  const MyHomePage(),
      darkTheme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.deepPurpleAccent),
    );
  }
}
