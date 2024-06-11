import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_weatherapp/bloc/weather_bloc.dart';
import 'package:flutter_application_weatherapp/bloc/weather_event.dart';
import 'package:flutter_application_weatherapp/bloc/weather_state.dart';
import 'package:flutter_application_weatherapp/widgets/CustomCityTile.dart';
import 'package:flutter_application_weatherapp/widgets/CustomFloatingActionButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

Set<String> cities = {};
Set<Weather> weatherlist = {};

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
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'tiny5',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                if (cities.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Cities added',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CustomCityTile(
                        weather: weatherlist.elementAt(index),
                      );
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
              return const Center(
                child: Text(
                  'Weather App',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              width: 50, // Adjust as needed for your desired button size
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink, // Change to your desired button color
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    context.read<WeatherBloc>().add(GetDetails());
                  },
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
