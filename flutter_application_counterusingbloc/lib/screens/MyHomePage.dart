
import 'package:flutter/material.dart';
import 'package:flutter_application_counterusingbloc/bloc/counter_bloc.dart';
import 'package:flutter_application_counterusingbloc/bloc/counter_event.dart';
import 'package:flutter_application_counterusingbloc/bloc/counter_state.dart';
// import 'package:flutter_application_counterusingbloc/bloc/counter_state.dart';
// import 'package:flutter_application_counterusingbloc/cubit/CounterCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget{
  int counter = 0;
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'AppBar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocBuilder<CounterCubit,int>(builder: (context,state){
          //     return Text(state.toString(),style: TextStyle(fontSize: state <= 10 ? 40 : 60,color: Colors.white),);
          // }),
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context, state) {
              return Text(state.count.toString(),style: TextStyle(fontSize: state.count <= 10 ? 40 : 60,color: Colors.white),);
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton.tonal(
                onPressed: (){
                  context.read<CounterBloc>().add(Decrement());
                },
                child: const Text('Decrement',style: TextStyle(fontSize: 16))
              ),
              FilledButton.tonal(
                onPressed: (){
                  context.read<CounterBloc>().add(Increment());
                },
                child: const Text('Increment',style: TextStyle(fontSize: 16))
              ),
            ],
          )
        ],
      ),
    );
  }

}