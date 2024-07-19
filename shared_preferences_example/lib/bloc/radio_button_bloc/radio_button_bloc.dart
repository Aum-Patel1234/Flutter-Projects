import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_event.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_state.dart';
import 'package:shared_preferences_example/view/enums.dart';

class RadioButtonBloc extends Bloc<RadioButtonEvent,RadioButtonState>{
  RadioButtonBloc():super(RadioButtonState(marriedStatus: MarriedStatus.single)){
    on<RadioButtonEventOnChanged>(_onRadioButtonEventOnChanged);
  }

  FutureOr<void> _onRadioButtonEventOnChanged(RadioButtonEventOnChanged event, Emitter<RadioButtonState> emit) {
    emit(RadioButtonState(marriedStatus: state.marriedStatus == MarriedStatus.single ? MarriedStatus.married : MarriedStatus.single));
  }
}