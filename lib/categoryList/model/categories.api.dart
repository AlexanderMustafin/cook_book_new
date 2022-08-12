import 'dart:convert';
import 'package:cook_book_new/categoryList/model/categories.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future<List<Category>> getCategory() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/categories/list');

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "9674d833damshd40e1f6feada213p152a58jsn440d333740ac",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['browse-categories'][9]['display']['categoryTopics']) {
      _temp.add(i['display']);
    }

    return Category.categoriesFromSnapshot(_temp);
  }
}