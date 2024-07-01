import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio = Dio();

  void getCompanyOverview(String symbol) async{
    final Uri url = Uri(
      scheme: 'https',
      host: 'www.alphavantage.co',
      path: '/query',
      queryParameters: {
        'function' : 'OVERVIEW',
        'symbol' : 'IBM',
        'apikey' : 'demo'
      }
    );
    Response response = await _dio.getUri(url);
    log(response.data.toString());
  }
  // https://www.alphavantage.co/
}