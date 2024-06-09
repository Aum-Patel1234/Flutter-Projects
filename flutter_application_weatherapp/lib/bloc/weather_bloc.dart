
import 'package:flutter_application_weatherapp/bloc/weather_event.dart';
import 'package:flutter_application_weatherapp/bloc/weather_state.dart';
import 'package:flutter_application_weatherapp/screens/weather_page.dart';
import 'package:flutter_application_weatherapp/weatherconnection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  WeatherBloc() : super(WeatherInitial()){
    on<GetDetails>((event, emit)async {
      emit(WeatherLoading());
      try {
       List<Weather> weatherList = [];
        for (String city in cities) {
          Weather weather = await weatherFactory(city);
          weatherList.add(weather);
        }
        emit(WeatherLoaded( weatherList: weatherList));   // emit new object 
      } catch (_) {
        emit(WeatherError());
      }
    });
  }
}