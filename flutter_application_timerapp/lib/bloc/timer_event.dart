
class TimerEvent{
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}


class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;
}

class TimerSet extends TimerEvent{
  final int hrs;
  final int minutes;
  final int seconds;

  TimerSet({required this.hrs, required this.minutes, required this.seconds});
}