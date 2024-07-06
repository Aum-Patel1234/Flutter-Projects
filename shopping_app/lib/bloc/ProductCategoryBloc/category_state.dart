
import 'package:stocks_app/model/data_model.dart';

class CategoryState{}

class CategoryStateInitial extends CategoryState{}

class CategoryStateLoading extends CategoryState{}

class CategoryStateLoadedState extends CategoryState{
  CategoryStateLoadedState({required this.data}); 
  
  final DataModel data;
}

class CategoryStateError extends CategoryState{}