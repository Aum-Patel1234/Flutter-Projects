import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_restapi_app/model/user_response_model.dart';
import 'package:http/http.dart';

class UserAPI {
  final Client _client = Client();

  Future<List?> getUsers() async {
    try {
      final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final Response data = await _client.get(url);

      List<dynamic>? map = jsonDecode(data.body);
      // log(map![0]['id'].toString());
      return map;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<UserResponseModel> getUserProfile(int index) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: 'users/${index + 1}',
    );

    final Response response = await _client.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);

    UserResponseModel userdata = UserResponseModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address(
        street: map['address']['street'],
        suite: map['address']['suite'],
        city: map['address']['city'],
        zipcode: map['address']['zipcode'],
        geo: Geo(
          lat: map['address']['geo']['lat'],
          lng: map['address']['geo']['lng'],
        ),
      ),
      phone: map['phone'],
      website: map['website'],
      company: Company(
        name: map['company']['name'],
        catchPhrase: map['company']['catchPhrase'],
        bs: map['company']['bs'],
      ),
    );

    return userdata;
  }
}
 