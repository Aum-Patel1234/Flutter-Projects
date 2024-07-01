
import 'package:flutter_application_recipes_app/model/recipes_model.dart';

class RecipeState{}

class RecipeStateInitial extends RecipeState{}

class RecipeStateLoading extends RecipeState{}

class RecipeStateLoaded extends RecipeState{
  final List<RecipeModel> recipes;

  RecipeStateLoaded({required this.recipes});
}