import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int _length = 0;

Future<int> increment()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  _length = prefs.getKeys().length;
  return _length+1;
}

void addUser(String userData,String key)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key,userData);
  log(prefs.getKeys().toString());
}

Future<List<String>?> fetchUsers(String key) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> list = [];
  for (String key in prefs.getKeys()) {
    String? str = prefs.getString(key);
    if(str != null){
      list.add(str);
    }
  }
  return list;
}

Future<bool> removeUser(String key) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.remove(key);
}

Future<void> clear()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<void> deleteUser(int id)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user${id+1}');
}

