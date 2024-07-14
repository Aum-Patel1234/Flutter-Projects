import 'package:flutter/material.dart';

abstract class DateEvent{}

class DateEventSelectedDate extends DateEvent{
  DateEventSelectedDate({required this.selectedDate,required this.timeOfDay});

  final DateTime selectedDate;
  TimeOfDay timeOfDay; 
}