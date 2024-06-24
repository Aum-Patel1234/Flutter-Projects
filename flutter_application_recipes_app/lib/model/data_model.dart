import 'dart:convert';

import 'package:flutter_application_recipes_app/model/recipes_model.dart';

class DataModel {
  final List<RecipeModel> recipes;

  DataModel({required this.recipes});

  factory DataModel.fromJSON(String body){
    Map<String ,dynamic> map = jsonDecode(body);
    return DataModel(
      recipes: (map['recipes'] as List).map((recipe) => RecipeModel.fromJSON(recipe)).toList()
    );
  }

  bool isEmpty(){
    return recipes.isEmpty;
  }
}