import 'package:flutter/material.dart';

abstract class CreateTodoEvent{}

class CreateTodoEventOnCreate extends CreateTodoEvent{
  CreateTodoEventOnCreate({required this.title, required this.description, required this.toBeCompletedByDate, required this.toBeCompletedByTime});

  final String title;
  final String? description;
  final DateTime toBeCompletedByDate;
  final TimeOfDay toBeCompletedByTime;
} 

class CreateTodoEventGetTodo extends CreateTodoEvent{
  CreateTodoEventGetTodo(this.id);

  final int id;
} 
class CreateTodoEventOnUpdate extends CreateTodoEvent{} 
