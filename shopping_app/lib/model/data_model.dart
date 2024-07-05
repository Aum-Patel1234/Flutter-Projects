import 'dart:convert';

import 'package:stocks_app/model/products_model.dart';

class DataModel{
  final List<ProductsModel> products;

  DataModel({required this.products});

  factory DataModel.fromJson(String body){
    Map<String,dynamic> map = json.decode(body);
    return DataModel(products: (map['products'] as List).map((product) => ProductsModel.fromMap(product)).toList());
  }
}