import 'package:flutter/material.dart';
import 'package:flutter_application_weatherapp/bloc/weather_bloc.dart';
import 'package:flutter_application_weatherapp/bloc/weather_event.dart';
import 'package:flutter_application_weatherapp/screens/weather_page.dart';
import 'package:flutter_application_weatherapp/weatherconnection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  _CustomFloatingActionButtonState createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();
  String? validationError;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.deepPurpleAccent,
              title: const Text(
                'Write the City Name',
                style: TextStyle(color: Colors.white),
              ),
              content: Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: cityController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter City Name here',
                          hintStyle: const TextStyle(
                            color: Colors.white24,
                          ),
                          errorText: validationError,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter a city";
                          return null;
                        },
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.location_city,
                    color: Colors.white60,
                  ),
                ],
              ),
              actions: [
                FilledButton.tonal(
                  onPressed: () {
                    cityController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () async {
                    // Validate form
                    if (formKey.currentState!.validate()) {
                      // Check if the city exists
                      bool exists = await doesCityExist(cityController.text);
                      if (exists) {
                        context.read<WeatherBloc>().add(AddCity(weatherList: weatherlist, city: cityController.text));
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          validationError = "Enter a valid city";
                        });
                      }
                    }
                    cityController.text = "";
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            );
          },
        );
      },
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cityController.dispose();
  }
}
