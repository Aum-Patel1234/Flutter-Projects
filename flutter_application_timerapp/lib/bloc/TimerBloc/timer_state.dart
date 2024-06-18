
import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable{
  final int hrs;
  final int minutes;
  final int seconds;

  const TimerState({required this.hrs, required this.minutes, required this.seconds});
}

class TimerInitial extends TimerState{
  const TimerInitial({required super.hrs, required super.minutes, required super.seconds});

  @override
  List<Object?> get props => [hrs,minutes,seconds];
}

class TimerPlay extends TimerState{
  const TimerPlay({required super.hrs, required super.minutes, required super.seconds});

  @override
  List<Object?> get props => [hrs,minutes,seconds];
}

class TimerPause extends TimerState{
  const TimerPause({required super.hrs, required super.minutes, required super.seconds});

  @override
  List<Object?> get props => [hrs,minutes,seconds];
}

class TimerComplete extends TimerState{
  const TimerComplete({required super.hrs, required super.minutes, required super.seconds});

  @override
  List<Object?> get props => [hrs,minutes,seconds];
}
