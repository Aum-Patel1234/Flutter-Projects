import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_event.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_state.dart';

class DateBloc extends Bloc<DateEvent,DateState>{
  DateBloc():super(DateState(selectedDate: DateTime.now(),time: TimeOfDay.now())){
    on<DateEventSelectedDate>(
      (event, emit) {
        emit(DateState(selectedDate: event.selectedDate,time: event.timeOfDay));  
      },
    );
  }
}