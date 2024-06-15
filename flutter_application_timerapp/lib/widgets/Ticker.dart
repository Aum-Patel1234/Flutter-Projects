import 'dart:async';

class Ticker{
  int hrs;
  int min;
  int sec;
  Ticker({required this.hrs,required this.min,required this.sec});
  Stream<int> tick (){
    int time = hrs*3600 + min * 60 + sec;
    return Stream.periodic(const Duration(seconds: 1),(x) => time - x - 1).take(time);
  }

}