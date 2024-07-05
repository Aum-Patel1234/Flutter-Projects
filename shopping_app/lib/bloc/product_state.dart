import 'package:stocks_app/model/category_list_model.dart';
import 'package:stocks_app/model/data_model.dart';

class ProductState{}

class ProductStateInitialState extends ProductState{}

class ProductStateLoadingState extends ProductState{}

class ProductStateLoadedState extends ProductState{
  final Map<int, DataModel> data;
  final CategoryListModel categoryListModel;

  ProductStateLoadedState({required this.categoryListModel, required this.data});
}

class ProductStateErrorState extends ProductState{}