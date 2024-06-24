
import 'dart:developer';

import 'package:flutter_application_recipes_app/model/data_model.dart';
import 'package:http/http.dart';

class ApiService {
  final Client _client = Client();

  Future<DataModel?> getrecipies()async{
    try{
      final Uri url = Uri.parse('https://dummyjson.com/recipes');
      final Response data = await _client.get(url);
      if(data.statusCode == 200){
        return DataModel.fromJSON(data.body);
      }
      log('Response Failed !');
      return null;
    }catch(e){
      log(e.toString());
      return null;
    }
  } 
  
}