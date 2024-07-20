import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';

abstract class CreateTodoEvent{}

class CreateTodoEventOnCreate extends CreateTodoEvent{
  CreateTodoEventOnCreate({required this.title, required this.description, required this.toBeCompletedByDate, required this.toBeCompletedByTime});

  final String title;
  final String? description;
  final DateTime toBeCompletedByDate;
  final TimeOfDay toBeCompletedByTime;
} 

class CreateTodoEventOnUpdate extends CreateTodoEvent{
  CreateTodoEventOnUpdate({required this.todo,this.isCompleted,this.completedAt});

  final TodoModel todo;
  final bool? isCompleted;
  final DateTime? completedAt;
} 
class CreateTodoEventOnDelete extends CreateTodoEvent{
  CreateTodoEventOnDelete({required this.todo});

  final TodoModel todo;
} 
