import 'package:flutter/material.dart';

class GreetingsPage extends StatefulWidget {
  final String name;
  final String collegename;

  const GreetingsPage(
      {super.key, required this.name, required this.collegename});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _GreetingsPage(name, collegename);
  }
}

class _GreetingsPage extends State<GreetingsPage> {
  final String name;
  final String collegename;

  // _GreetingsPage(required this.name, this.collegename);
  _GreetingsPage(this.name, this.collegename);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        centerTitle: true,
      ),
      body: Center(
        child: RichText(
          
          text: TextSpan(
            style: TextStyle(fontSize: 20, color: Colors.black),
            children: [
              TextSpan(text: name,style: const TextStyle(fontWeight: FontWeight.bold),),
              const TextSpan(text: ' is from ',),
              TextSpan(text: collegename,style: const TextStyle(fontWeight: FontWeight.bold),),
              const TextSpan(text: ' in Mumbai University',),
            ]
           
          ),

        ),
      ),
    );
  }
}
