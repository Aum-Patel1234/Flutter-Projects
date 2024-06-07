
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/AddToList.dart';
import 'package:todo_app/widgets/Notifications.dart';
import 'package:todo_app/widgets/Task.dart';
import 'package:todo_app/widgets/TaskInput.dart';

class NewTask extends StatefulWidget {
  Task? task;

  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 1,
        title: const Text(
          'New Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * 0.6,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TaskInput(
                    title: 'What is to be done?',
                    hintText: 'Enter Task Here',
                    icon: Icons.speaker_group_rounded),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TaskInput(
                      title: 'Due Date',
                      hintText: 'Date not set',
                      icon: Icons.calendar_month,
                      enableDateinput: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Notifications(),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: AddtoList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.task = Task('2', 'dd', 'dddfg', false);
          Navigator.pop(context, widget.task);
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.check,
          color: Colors.blueAccent,
          size: 30,
        ),
      ),
    );
  }

  // void Function
}
