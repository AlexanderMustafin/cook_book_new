import 'package:cook_book_new/pages/salads.dart';
import 'package:flutter/material.dart';

class Salad {
  final String name;
  final int cookTime;
  final String imagePath;

  const Salad({
    required this.name,
    required this.cookTime,
    required this.imagePath,
    // required this.recipe,
  });
// final Widget recipe;
}

class HomeCategories {
  final String name;
  final String imagePath;
  final Widget recipe;

  HomeCategories({
    required this.name,
    required this.imagePath,
    required this.recipe,
  });
}

List<HomeCategories> categories = [
  HomeCategories(
    name: 'Salads',
    imagePath: 'assets/img/salad.jpg',
    recipe: const Salads(),
  ),
  HomeCategories(
    name: 'Snacks',
    imagePath: 'assets/img/snacks.jpg',
    recipe: const Salads(),
  ),
  HomeCategories(
    name: 'First meal',
    imagePath: 'assets/img/soup.jpg',
    recipe: const Salads(),
  ),
  HomeCategories(
      name: 'Second meal',
      imagePath: 'assets/img/second_meal.jpg',
      recipe: const Salads()),
  HomeCategories(
      name: 'Fish meal',
      imagePath: 'assets/img/fish_meal.jpg',
      recipe: const Salads()),
  HomeCategories(
      name: 'Breakfast',
      imagePath: 'assets/img/breakfast.jpg',
      recipe: const Salads()),
];

final salads = [
  const Salad(
    name: 'Caesar salad',
    cookTime: 30,
    imagePath: 'assets/img/greek_salad.jpg',
  ),
  const Salad(
      name: 'Vinaigrette',
      cookTime: 45,
      imagePath: 'assets/img/vinaigrette_salad.webp'),
  const Salad(
      name: 'Easy Pasta Salad',
      cookTime: 45,
      imagePath: 'assets/img/pasta_salad.jpg'),
  const Salad(
      name: 'Greek salad',
      cookTime: 20,
      imagePath: 'assets/img/greek_salad.jpg'),
  const Salad(
      name: 'Salad with chiken',
      cookTime: 60,
      imagePath: 'assets/img/chicken_salad.jpg'),
];
