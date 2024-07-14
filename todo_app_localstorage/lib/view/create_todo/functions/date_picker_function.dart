import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_event.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/static_date_time.dart';

void datePickerFuntion(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate:  DateTime(DateTime.now().year + 10),
    ).then((value) {
      if(value != null){
        StaticDateTime.date = value;
        context.read<DateBloc>().add(DateEventSelectedDate(selectedDate: value, timeOfDay: StaticDateTime.time));
      }
    });
}