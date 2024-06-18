
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_event.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModeBloc extends Bloc<ModeEvent,ModeState>{
  ModeBloc():super(ModeState(isDarkMode: false)){
    on<ChangeEvent>((event, emit) {
      emit(ModeState(isDarkMode: !state.isDarkMode));
    },);
  }
}