
import 'package:flutter_application_recipes_app/model/recipes_model.dart';

class RecipeState{
  final List<RecipeModel> recipes;

  RecipeState({required this.recipes});
}

class RecipeStateInitial extends RecipeState{
  RecipeStateInitial({required super.recipes});
}

class RecipeStateLoading extends RecipeState{
  RecipeStateLoading({required super.recipes});
}

class RecipeStateLoaded extends RecipeState{
  RecipeStateLoaded({required super.recipes});
}