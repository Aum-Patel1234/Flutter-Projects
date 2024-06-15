import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/timer_bloc.dart';
import 'package:flutter_application_timerapp/bloc/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSections extends StatelessWidget {
  const TimeSections({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            // color: Colors.amber,
            width: width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  state.hrs.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
                const Text(
                  ':',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  state.minutes.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
                const Text(
                  ':',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  state.seconds.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
