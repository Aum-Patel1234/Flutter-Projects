import 'dart:convert';

class CategoryListModel{
  final List<String> categories;

  CategoryListModel({required this.categories});

  factory CategoryListModel.fromMap(String body){
    var jsonDecode2 = jsonDecode(body);
    return CategoryListModel(categories: List.from(jsonDecode2));
  }
}