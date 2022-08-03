import 'dart:convert';
import 'package:cook_book_new/recipeList/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe(String tag) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "10", "start": "0", "tag": tag});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "50bd115c82msh6cd98e24b6a03c6p1e2ca2jsn1c895ef80112",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}