
import 'package:cook_book_new/pages/recipe_card.dart';
import 'package:cook_book_new/pages/recipes.dart';
import 'package:cook_book_new/recipeList/models/recipe.api.dart';
import 'package:cook_book_new/recipeList/models/recipe.dart';
import 'package:cook_book_new/recipe_info_list/recipe_info_card.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({this.tag, this.displayName});
  final String tag;
  final String displayName;

  @override
  _HomePageState createState() => _HomePageState(this.tag, this.displayName);
}

class _HomePageState extends State<HomePage> {

  final String tag;
  final String displayName;
  _HomePageState(this.tag, this.displayName);

  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(tag); //TODO Передать tag
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text(displayName),
              SizedBox(width: 10),
              Icon(Icons.restaurant_menu),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecipesInfoCard(displayName: _recipes[index].name,
                        image: _recipes[index].images,
                        cookingTime: _recipes[index].totalTime,
                        preparationsList: _recipes[index].preparationSteps,
                        ingridientsParameters: _recipes[index].ingridientsParameters,
                        ))); 
            },
                    child: RecipeCard(
                        title: _recipes[index].name,
                        cookTime: _recipes[index].totalTime,
                        rating: _recipes[index].rating.toString(),
                        thumbnailUrl: _recipes[index].images),
                  );
                },
              ));
  }
}