import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/widgets/meal_types.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipes App',
          style: TextStyle(
              fontFamily: 'tiny5',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: const MealTypes(),
    );
  }
}


