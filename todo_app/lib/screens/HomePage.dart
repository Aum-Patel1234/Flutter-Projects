import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Appbar.dart';

Color textColor = Colors.white;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Appbar(),
        backgroundColor: Colors.black38,
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 152, 152, 152),
      ),
      body: Container(),
    );
  }
}
