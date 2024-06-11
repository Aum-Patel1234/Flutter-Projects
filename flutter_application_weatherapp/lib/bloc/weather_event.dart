

import 'package:weather/weather.dart';

class WeatherEvent{
}

class GetDetails extends WeatherEvent{
}
class AddCity extends WeatherEvent{
  Set<Weather> weatherList;
  final String city ;

  AddCity({required this.weatherList,required this.city});
}