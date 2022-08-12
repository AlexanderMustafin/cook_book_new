import 'dart:convert';
import 'package:cook_book_new/recipeList/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe(String tag) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "20", "start": "0", "tag": tag});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "9674d833damshd40e1f6feada213p152a58jsn440d333740ac",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}