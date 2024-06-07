import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Appbar.dart';
import 'package:todo_app/widgets/Task.dart';
import 'package:todo_app/widgets/Tile.dart';

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
        elevation: 1,
        // shadowColor: const Color.fromARGB(255, 152, 152, 152),
      ),
      body: Container(
        child: Tile(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Task? newtask = await Navigator.pushNamed<Task?>(context, '/newtask') as Task?;
          print('here - ${newtask?.day}');
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add,color: Colors.blue,size: 30,),
      ),
    );
  }
}
