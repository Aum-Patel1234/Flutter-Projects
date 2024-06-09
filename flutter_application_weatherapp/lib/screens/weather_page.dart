import 'package:flutter/material.dart';
import 'package:flutter_application_weatherapp/bloc/weather_bloc.dart';
import 'package:flutter_application_weatherapp/bloc/weather_event.dart';
import 'package:flutter_application_weatherapp/bloc/weather_state.dart';
import 'package:flutter_application_weatherapp/widgets/CustomCityTile.dart';
import 'package:flutter_application_weatherapp/widgets/CustomFloatingActionButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

List<String> cities = ["Mumbai", "Kolkata","Chennai","Nairobi"];

// ignore: must_be_immutable
class WeatherPage extends StatelessWidget {
  Weather? w;
  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CustomCityTile(weather: state.weatherList[index],);
                    },
                  ),
                );
              } else if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                    strokeWidth: 8,
                  ),
                );
              }
              return Container(
                height: 200,
                color: Colors.white,
                child: const Center(
                  child: Text('No Data'),
                ),
              );

              // return const SizedBox();
            },
          ),
          FilledButton(
            onPressed: () {
              context.read<WeatherBloc>().add(GetDetails());
            },
            child: const Text(
              'Get',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
