import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/timer_bloc.dart';
import 'package:flutter_application_timerapp/bloc/timer_event.dart';
import 'package:flutter_application_timerapp/widgets/CustomAlertDialog.dart';
import 'package:flutter_application_timerapp/widgets/DisplayButtons.dart';
import 'package:flutter_application_timerapp/widgets/TimeSections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'Timer App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          TimeSections(width: width),
          SizedBox(
            height: height * 0.1,
          ),
          const Buttons(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog<List<int>>(
            context: context, 
            builder: (context){
              return CustomAlertDialog();
            }
          ).then((time) {
              if (time != null) {
              // print('Received time: $time');
              context.read<TimerBloc>().add(TimerSet(hrs: time[0], minutes: time[1], seconds: time[2]));
            }
          });
        },
        child: const Icon(Icons.add,color: Colors.black,size: 30,),
      ),
    );
  }
}
