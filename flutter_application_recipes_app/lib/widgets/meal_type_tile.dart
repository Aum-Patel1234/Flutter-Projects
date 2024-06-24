
import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_bloc.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_event.dart';
import 'package:flutter_application_recipes_app/view/recipes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealTypeTile extends StatelessWidget {
  const MealTypeTile({super.key, required this.mealtype, required this.tilecolor, required this.imagepath});

  final String mealtype;
  final Color tilecolor;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => Recipes(mealtype: mealtype,)));
          context.read<RecipeBloc>().add(GetRecipes());
        },
        child: Container(
          height: height * 0.12,
          decoration: BoxDecoration(
            color: tilecolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  mealtype,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: height * 0.1,
                  height: height * 0.1,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      imagepath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
