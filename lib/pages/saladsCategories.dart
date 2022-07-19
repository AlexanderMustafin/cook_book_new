import 'package:cook_book_new/pages/salads.dart';
import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

class SaladsRecipe {
  const SaladsRecipe({
    required this.name,
    required this.cookTime,
    required this.imagePath,
    // required this.recipe,
  });

  final String name;
  final int cookTime;
  final String imagePath;
  // final Widget recipe;
}

class HomeCategories {
  const HomeCategories({
    required this.name,
    required this.imagePath,
    required this.recipe,
  });

  final String name;
  final String imagePath;
  final Widget recipe;
}

List<HomeCategories> categories = [
  HomeCategories(name: 'Salads', imagePath: 'assets/img/salad.jpg', recipe: Salads()),
  HomeCategories(name: 'Snacks', imagePath: 'assets/img/snacks.jpg', recipe: Salads()),
  HomeCategories(name: 'First meal', imagePath: 'assets/img/soup.jpg', recipe: Salads()),
  HomeCategories(name: 'Second meal', imagePath: 'assets/img/second_meal.jpg', recipe: Salads()),
  HomeCategories(name: 'Fish meal', imagePath: 'assets/img/fish_meal.jpg', recipe: Salads()),
  HomeCategories(name: 'Breakfast', imagePath: 'assets/img/breakfast.jpg', recipe: Salads()),
];

List<SaladsRecipe> salads = [
  SaladsRecipe(name: 'Caesar salad', cookTime: 30, imagePath: 'assets/img/caesar_salad.jpg'),
  SaladsRecipe(name: 'Vinaigrette', cookTime: 45, imagePath: 'assets/img/vinaigrette_salad.webp'),
  SaladsRecipe(name: 'Easy Pasta Salad', cookTime: 45, imagePath: 'assets/img/pasta_salad.jpg'),
  SaladsRecipe(name: 'Greek salad', cookTime: 20, imagePath: 'assets/img/greek_salad.jpg'),
  SaladsRecipe(name: 'Salat with chiken', cookTime: 60, imagePath: 'assets/img/chicken_salad.jpg'),
];