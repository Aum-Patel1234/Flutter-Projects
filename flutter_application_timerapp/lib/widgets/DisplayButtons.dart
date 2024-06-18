import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_bloc.dart';
import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_event.dart';
import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_state.dart';
import 'package:flutter_application_timerapp/widgets/Buttons/PauseButton.dart';
import 'package:flutter_application_timerapp/widgets/Buttons/PlayButton.dart';
import 'package:flutter_application_timerapp/widgets/Buttons/ResetButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  PlayButton(onTap: () => context.read<TimerBloc>().add(TimerStarted())),
                ],
              TimerPlay() => [
                  ResetButton(onTap: () => context.read<TimerBloc>().add(const TimerReset())),
                  PauseButton(onTap: () => context.read<TimerBloc>().add(const TimerPaused())),
                ],
              TimerPause() => [
                  ResetButton(onTap: () => context.read<TimerBloc>().add(const TimerReset())),
                  PlayButton(onTap: () => context.read<TimerBloc>().add(const TimerResumed())),
                ],
              TimerComplete() => [
                  ResetButton(onTap: () => context.read<TimerBloc>().add(const TimerReset())),
                ],
              TimerState() => [const SizedBox()]
            }
          ],
        );
      },
    );
  }
}
