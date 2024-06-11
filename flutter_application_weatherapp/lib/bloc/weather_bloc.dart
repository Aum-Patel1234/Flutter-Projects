
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
        Set<Weather> weatherList = {};
          for (String city in cities) {
            Weather weather = await getWeather(city);
            weatherList.add(weather);
          }
          weatherlist = weatherList;
          emit(WeatherLoaded(weather: weatherList.elementAt(0)));   // emit new object 
      } catch (_) {
        emit(WeatherError());
      }
    });
    on<AddCity>((event, emit) async{
      emit(WeatherLoading());
      try{
        Weather w = await getWeather(event.city);
        if(cities.add(event.city)){
          weatherlist.add(w);
        }
        // print(cities);
        emit(WeatherLoaded(weather: w));
      }catch(_){
        emit(WeatherError());
      }
    },);
  }
}