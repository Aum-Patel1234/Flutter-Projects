import 'package:equatable/equatable.dart';
 
class Task extends Equatable{
  @override
  List<Object?> get props => [time];

  final String? day;
  final String? title;
  final String? time;
  bool completed = false;

  Task(this.day, this.title, this.time,this.completed,);
}
