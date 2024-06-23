
import 'package:flutter_application_restapi_app/theme/theme_event.dart';
import 'package:flutter_application_restapi_app/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc():super(ThemeState(isDarkMode: true)){
    on<ChangedTheme>(_onChangedTheme);
  }

  void _onChangedTheme(ChangedTheme event, Emitter<ThemeState> emit) {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }
}