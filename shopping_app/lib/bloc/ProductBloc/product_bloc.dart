import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductBloc/product_event.dart';
import 'package:stocks_app/bloc/ProductBloc/product_state.dart';
import 'package:stocks_app/model/category_list_model.dart';
import 'package:stocks_app/model/data_model.dart';
import 'package:stocks_app/service/api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductStateLoadingState()) {
    on<ProductEventGetProducts>(_onProductEventGetProducts);
  }

  final ApiService _apiService = ApiService();

  FutureOr<void> _onProductEventGetProducts(ProductEventGetProducts event, Emitter<ProductState> emit) async {
    // emit(ProductStateLoadingState());
    CategoryListModel? categoriesList = await _apiService.getCategoryList();

    if (categoriesList != null) {
      Map<int, DataModel> map = {};
      for (int i = 0; i < categoriesList.categories.length; i++) {
        String section = categoriesList.categories[i];
        DataModel? dataModel = await _apiService.getFiveProducts(section); 
        if(dataModel != null){
          map[i] = dataModel;
        }
      }
      log(map.toString());
      emit(ProductStateLoadedState(categoryListModel: categoriesList ,data: map,));
    } else {
      emit(ProductStateErrorState());
    }
  }
}
