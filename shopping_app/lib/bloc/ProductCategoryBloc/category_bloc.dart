import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_event.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_state.dart';
import 'package:stocks_app/model/data_model.dart';
import 'package:stocks_app/service/api_service.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  CategoryBloc():super(CategoryStateInitial()){
    on<CategoryEventGetSectionProducts>(_onCategoryEventGetSectionProducts);
  }

  final ApiService _apiService = ApiService();

  Future<FutureOr<void>> _onCategoryEventGetSectionProducts(CategoryEventGetSectionProducts event, Emitter<CategoryState> emit) async {
    emit(CategoryStateLoading());
    DataModel? data = await _apiService.getProducts(event.section);
    if(data != null){
      emit(CategoryStateLoadedState(data: data));
    }else{
      emit(CategoryStateError());
    }
  }

}
