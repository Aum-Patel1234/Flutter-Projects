import 'package:stocks_app/model/category_list_model.dart';
import 'package:stocks_app/model/data_model.dart';

class ProductState{}

class ProductStateInitialState extends ProductState{}

class ProductStateLoadingState extends ProductState{}

class ProductStateLoadedState extends ProductState{
  ProductStateLoadedState({required this.categoryListModel, required this.data});

  final Map<int, DataModel> data;
  final CategoryListModel categoryListModel;
}

class ProductStateErrorState extends ProductState{}