

import 'package:flutter/material.dart';
import 'package:todo_app/screens/HomePage.dart';
import 'package:todo_app/screens/NewTask.dart';
import 'package:todo_app/widgets/Task.dart';

class Navigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());

      case '/newtask':
        return MaterialPageRoute<Task?>(builder: (context)=> NewTask());
      
      default: _errorRoute();
    } 
    return _errorRoute();
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (context) => (
        Scaffold(
          appBar: AppBar(title: const Text('Error page',style: TextStyle(fontSize: 20),),),
          body: const Center(
            child: Text('Some Error Occured !!',style: TextStyle(fontSize: 36),), 
          ),
        )
      ),

    );
  }
}
