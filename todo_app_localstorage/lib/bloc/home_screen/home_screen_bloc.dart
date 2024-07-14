import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_event.dart';
import 'package:todo_app_localstorage/bloc/home_screen/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent,HomeScreenState>{
  HomeScreenBloc():super(HomeScreenState(index: 0)){
    on<HomeScreenEventChangeScreen>(_onHomeScreenEventChangeScreen);
  }

  FutureOr<void> _onHomeScreenEventChangeScreen(HomeScreenEventChangeScreen event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenState(index: event.index));
  }
}