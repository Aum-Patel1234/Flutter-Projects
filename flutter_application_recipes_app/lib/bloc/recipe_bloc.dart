import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_recipes_app/bloc/recipe_event.dart';
import 'package:flutter_application_recipes_app/bloc/recipe_state.dart';
import 'package:flutter_application_recipes_app/model/data_model.dart';
import 'package:flutter_application_recipes_app/service/api_service.dart';

class RecipeBloc extends Bloc<RecipeEvent,RecipeState>{
  RecipeBloc():super(RecipeStateInitial()){
    on<GetRecipes>(_onGetRecipes);
  }

  FutureOr<void> _onGetRecipes(GetRecipes event, Emitter<RecipeState> emit) async{
    emit(RecipeStateLoading());

    ApiService api = ApiService();
    DataModel? data = await api.getrecipies();

    emit(RecipeStateLoaded(recipes: data!.recipes));
  }
}