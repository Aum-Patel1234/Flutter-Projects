import 'dart:developer';

import 'package:http/http.dart';
import 'package:stocks_app/model/category_list_model.dart';
import 'package:stocks_app/model/data_model.dart';

class ApiService {
  final Client _client = Client();

  Future<CategoryListModel?> getCategoryList() async{
    try{
      final Uri url = Uri(
        scheme: 'https',
        host: 'dummyjson.com',
        path: '/products/category-list',
      );
      final Response response = await _client.get(url);
      if(response.statusCode == 200){
        return CategoryListModel.fromMap(response.body);
      }
      log('Some Error occured..');
    }catch(e){
      log(e.toString());
    }
    return null;
  } 

  Future<DataModel?> getFiveProducts(String section) async {
    try {
      final Uri url = Uri(
        scheme: 'https',
        host : 'dummyjson.com',
        path: '/products/category/$section',
        queryParameters: {
          'limit' : '5'
        }
      );
      final Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return DataModel.fromJson(response.body);
      } else {
        log('Something went wrong..');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
