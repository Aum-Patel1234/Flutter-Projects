import 'dart:async';

import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_event.dart';
import 'package:flutter_application_timerapp/bloc/TimerBloc/timer_state.dart';
import 'package:flutter_application_timerapp/widgets/Ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int _hrs = 0;
int _min = 0;
int _sec = 60;

StreamSubscription<int>? subscription;
Ticker? ticker;

// events - TimerStarted,TimerPaused,TimerResumed,TimerReset
// states - TimerInitial,TimerPlay,TimerPause,TimerComplete
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial(hrs: _hrs, minutes: _min, seconds: _sec)) {
    on<TimerStarted>((event, emit) {
      if (ticker == null) {
        ticker = Ticker(hrs: _hrs, min: _min, sec: _sec);
      }
      emit(TimerPlay(hrs: _hrs, minutes: _min, seconds: _sec));
      Stream<int> tick = ticker!.tick();
      subscription = tick.listen((event) {
        // print(event);
        _hrs = (event ~/ 3600) % 60;
        _min = (event ~/ 60) % 60;
        _sec = event % 60;
        add(TimerTicked(duration: event));
      });
    });
    on<TimerTicked>((event, emit) {
      _hrs = (event.duration ~/ 3600) % 60;
      _min = (event.duration ~/ 60) % 60;
      _sec = event.duration % 60;
      if (event.duration > 0) {
        emit(TimerPlay(hrs: _hrs, minutes: _min, seconds: _sec));
        return;
      }
      emit(TimerComplete(hrs: _hrs, minutes: _min, seconds: _sec));
    });
    on<TimerPaused>((event, emit) {
      subscription?.pause();
      emit(TimerPause(hrs: _hrs, minutes: _min, seconds: _sec));
    });
    on<TimerResumed>((event, emit) {
      subscription?.resume();
      add(TimerTicked(duration: _hrs * 3600 + _min * 60 + _sec));
    });
   on<TimerReset>((event, emit) {
      subscription?.cancel();
      subscription = null;
      emit(TimerInitial(hrs: _hrs, minutes: _min, seconds: _sec));
    });
    on<TimerSet>((event, emit) {
      _hrs = event.hrs;
      _min = event.minutes;
      _sec = event.seconds;
      ticker = Ticker(hrs: _hrs, min: _min, sec: _sec); // Corrected here
      emit(TimerInitial(hrs: _hrs, minutes: _min, seconds: _sec));
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
