import 'package:flutter/material.dart';

class TodoModel {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;
  final DateTime toBeCompletedByDate;
  final TimeOfDay toBeCompletedByTime;

  TodoModel({
    this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.deletedAt,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    required this.toBeCompletedByDate,
    required this.toBeCompletedByTime,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    // log('Map data: $map'); 
    return TodoModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String?,
      isCompleted: (map['isCompleted'] as int) == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
      completedAt: map['completedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['completedAt'] as int)
          : null,
      toBeCompletedByDate: DateTime.fromMillisecondsSinceEpoch(map['toBeCompletedByDate'] as int),
      toBeCompletedByTime: TimeOfDay(
        hour: int.parse((map['toBeCompletedByTime'] as String).split(':')[0]),
        minute: int.parse((map['toBeCompletedByTime'] as String).split(':')[1]),
      ),
    );
  }

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? updatedAt,
    DateTime? toBeCompletedByDate,
    TimeOfDay? toBeCompletedByTime,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt,
      completedAt: completedAt,
      toBeCompletedByDate: toBeCompletedByDate ?? this.toBeCompletedByDate,
      toBeCompletedByTime: toBeCompletedByTime ?? this.toBeCompletedByTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'completedAt': completedAt?.millisecondsSinceEpoch,
      'toBeCompletedByDate': toBeCompletedByDate.millisecondsSinceEpoch,
      'toBeCompletedByTime': '${toBeCompletedByTime.hour}:${toBeCompletedByTime.minute}',
    };
  }
}
/*
'CREATE TABLE $tableName (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  title TEXT NOT NULL,
  description TEXT, 
  isCompleted INTEGER NOT NULL,
  deletedAt INTEGER, 
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER,
  completedAt INTEGER,
  toBeCompletedByDate INTEGER NOT NULL,
  toBeCompletedByTime TEXT NOT NULL
*/