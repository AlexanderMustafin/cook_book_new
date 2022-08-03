import 'dart:convert';
import 'package:cook_book_new/categoryList/model/categories.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future<List<Category>> getCategory() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/categories/list');

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "50bd115c82msh6cd98e24b6a03c6p1e2ca2jsn1c895ef80112",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
    });

    Map data = jsonDecode(response.body);
    var index = 0;
    List _temp = [];

    for (var i in data['browse-categories'][9]['display']['categoryTopics']) {
      print(i['display']);
      _temp.add(i['display']);
    }

    return Category.categoriesFromSnapshot(_temp);
  }
}