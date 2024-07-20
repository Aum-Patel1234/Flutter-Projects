import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_event.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_state.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/static_date_time.dart';

class DateBloc extends Bloc<DateEvent,DateState>{
  DateBloc():super(DateState(selectedDate: StaticDateTime.date,time: StaticDateTime.time)){
    on<DateEventSelectedDate>(
      (event, emit) {
        emit(DateState(selectedDate: event.selectedDate,time: event.timeOfDay));  
      },
    );
  }
}