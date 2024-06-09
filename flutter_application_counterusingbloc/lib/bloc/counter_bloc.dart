import 'package:flutter_application_counterusingbloc/bloc/counter_event.dart';
import 'package:flutter_application_counterusingbloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) => emit(counter(state)));

    on<Decrement>(
      (event, emit) => emit(countersub(state)),
    );
  }
  
  CounterState counter(CounterState state) {
    return CounterState(state.count + 1);
  }
  CounterState countersub(CounterState state) {
    return CounterState(state.count - 1);
  }
}
