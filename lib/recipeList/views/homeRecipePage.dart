import 'package:cook_book_new/recipeList/models/recipe.api.dart';
import 'package:cook_book_new/recipeList/models/recipe.dart';
import 'package:cook_book_new/recipeList/views/widgets/recipe_card.dart';
import 'package:cook_book_new/recipe_info_list/recipe_info_card.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({required this.tag, required this.displayName});
  final String tag;
  final String displayName;

  @override
  _HomePageState createState() => _HomePageState(this.tag, this.displayName);
}

class _HomePageState extends State<HomePage> {

  final String tag;
  final String displayName;
  _HomePageState(this.tag, this.displayName);

  late List<Recipe> _recipes;
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
              Expanded(child: Text(displayName, overflow: TextOverflow.ellipsis)),
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
                        thumbnailUrl: _recipes[index].images,
                        thisRecipe: _recipes[index]),
                  );
                },
              ));
  }
}