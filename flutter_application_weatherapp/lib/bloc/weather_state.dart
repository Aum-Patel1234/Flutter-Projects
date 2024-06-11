
import 'package:weather/weather.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
}

class WeatherLoaded extends WeatherState {
  Weather weather;
  WeatherLoaded( {required this.weather});
}

class WeatherError extends WeatherState {}
