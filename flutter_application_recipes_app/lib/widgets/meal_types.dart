import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/widgets/meal_type_tile.dart';

class MealTypes extends StatelessWidget {
  const MealTypes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MealTypeTile(mealtype: 'Breakfast', tilecolor: Colors.brown.shade200, imagepath: 'assets/images/Breakfast.png',),
          MealTypeTile(mealtype: 'Lunch', tilecolor: Colors.brown.shade300, imagepath: 'assets/images/Lunch.png',),
          MealTypeTile(mealtype: 'Dinner', tilecolor: Colors.brown.shade400, imagepath: 'assets/images/Dinner.png',),
          MealTypeTile(mealtype: 'Snack', tilecolor: Colors.orange.shade200, imagepath: 'assets/images/Snack.png',),
          MealTypeTile(mealtype: 'Dessert', tilecolor: Colors.pink.shade200, imagepath: 'assets/images/Dessert.png',),
          MealTypeTile(mealtype: 'Side Dish', tilecolor: Colors.green.shade200, imagepath: 'assets/images/SideDish.png',),
          MealTypeTile(mealtype: 'Appetizer', tilecolor: Colors.yellow.shade200, imagepath: 'assets/images/Appetizer.png',),
          MealTypeTile(mealtype: 'Beverage', tilecolor: Colors.blue.shade200, imagepath: 'assets/images/Beverage.png',),
        ],
      ),
    );
  }
}