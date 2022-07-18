import 'package:cook_book_new/pages/salads.dart';
import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

class SaladsCategories {
  const SaladsCategories({
    required this.name,
    required this.cookTime,
    required this.imagePath,
    required this.recipe,
  });

  final String name;
  final String cookTime;
  final String imagePath;
  final Widget recipe;
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

List<SaladsCategories> salads = [
  SaladsCategories(name: 'Salsa', cookTime: '50 min', imagePath: 'assets/img/salad.jpg', recipe: Salsa()),
  SaladsCategories(name: 'Perigorskiy salat', cookTime: '60 min', imagePath: 'assets/img/breakfast.jpg', recipe: Salsa()),
  SaladsCategories(name: 'Merkury', cookTime: '120 min', imagePath: 'assets/img/second_meal.jpg', recipe: Salsa()),
  SaladsCategories(name: 'Grecheskiy', cookTime: '45 min', imagePath: 'assets/img/salad.jpg', recipe: Salsa()),
  SaladsCategories(name: 'Salat with chiken', cookTime: '120 min', imagePath: 'assets/img/salad.jpg', recipe: Salsa()),
];
