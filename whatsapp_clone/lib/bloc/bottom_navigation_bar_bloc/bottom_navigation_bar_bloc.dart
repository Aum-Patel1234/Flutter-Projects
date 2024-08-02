import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent,BottomNavigationBarState>{
  BottomNavigationBarBloc():super(BottomNavigationBarState(index: 0)){
    on<BottomNavigationBarEventOnTap>(_onBottomNavigationBarEventOnTap);
  }

  FutureOr<void> _onBottomNavigationBarEventOnTap(BottomNavigationBarEventOnTap event, Emitter<BottomNavigationBarState> emit) {
    emit(BottomNavigationBarState(index: event.index));
  }
}