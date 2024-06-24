import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_bloc.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_state.dart';
import 'package:flutter_application_recipes_app/model/recipes_model.dart';
import 'package:flutter_application_recipes_app/widgets/recipe_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key, required this.mealtype});

  final String mealtype;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealtype,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeStateLoading) {
            return const Center(
              child: SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  color: Colors.cyan,
                ),
              ),
            );
          }
          if (state is RecipeStateLoaded) {
            List<RecipeModel> recipes = [];
            for (RecipeModel recipe in state.recipes) {
              for (String meal in recipe.mealType) {
                if (meal == mealtype) {
                  recipes.add(recipe);
                }
              }
            }
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeTileWidget(
                  recipe: recipes[index],
                );
              },
            );
          }
          return const Center(child: Text('No Data Found !'));
        },
      ),
    );
  }
}
