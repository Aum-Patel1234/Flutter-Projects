import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class CustomCityTile extends StatelessWidget {
  final Weather weather;

  const CustomCityTile({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String cloudiness = cloudy();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2C2C2C), // Dark Gray
              Color(0xFF3B3B3B), // Medium Dark Gray
              Color(0xFF565656), // Medium Gray
              Color(0xFF707070), // Light Gray
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weather.areaName ?? 'N/A',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    weather.temperature?.celsius?.toStringAsFixed(1) ?? 'N/A',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Humidity - ${weather.humidity ?? 'N/A'}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    cloudiness,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  String cloudy(){
    double? cloudiness = weather.cloudiness;
    if(cloudiness! > 95){
      return "Overcast";
    }else if(cloudiness > 50){
      return "Mostly cloudy";
    }else if(cloudiness > 25){
      return "Partly cloudy";
    }
    return "Sunny";
  }
}
