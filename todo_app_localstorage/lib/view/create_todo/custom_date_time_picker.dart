import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_bloc.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_event.dart';
import 'package:todo_app_localstorage/bloc/date_bloc/date_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/date_picker_function.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/build_card.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/static_date_time.dart';

class CustomDateAndTimePicker extends StatelessWidget {
  const CustomDateAndTimePicker({super.key, this.todo});

  final TodoModel? todo;

  @override
  Widget build(BuildContext context) {
    if(todo != null){
      StaticDateTime.date = todo!.toBeCompletedByDate;
      StaticDateTime.time = todo!.toBeCompletedByTime;
    }
    return BlocBuilder<DateBloc, DateState>(builder: (context, state) {
      return Column(
        children: [
          buildCard(
            context,
            onPressed: () {
              datePickerFuntion(context);
              StaticDateTime.date = state.selectedDate;
            },
            child: Text(
              state.selectedDate.toLocal().toString().split(' ')[0],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buildCard(
            context,
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  StaticDateTime.time = value;
                }
                context.read<DateBloc>().add(DateEventSelectedDate(selectedDate: state.selectedDate, timeOfDay: StaticDateTime.time));
              });
            },
            child: Text(
              state.time.format(context),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }
}
