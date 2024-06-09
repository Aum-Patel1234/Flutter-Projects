

import 'package:flutter/material.dart';
import 'package:flutter_application_weatherapp/screens/weather_page.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String? city = await showDialog<String?>(
          context: context,
          builder: (context) {
            TextEditingController? citycontroller = TextEditingController();
            return AlertDialog(
              backgroundColor: Colors.deepPurpleAccent,
              title: const Text(
                'Write the City Name',
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                controller: citycontroller,
                decoration: const InputDecoration(
                  hintText: 'Enter City Name here',
                  hintStyle: TextStyle(
                    color: Colors.white24,
                  ),
                ),
              ),
              actions: [
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop<String?>(context, citycontroller.text);
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
        cities.add(city!);
      },
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.blueAccent,
      ),
    );
  }
}
