import 'package:cook_book_new/recipeList/models/ingridient.dart';

class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  List preparationSteps;
  List<Ingrident> ingridientsParameters;

  Recipe({required this.name,
     required this.images,
     required this.rating,
     required this.totalTime,
     
     required this.preparationSteps,
     required this.ingridientsParameters,
     });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['details']['name'] as String,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,

        preparationSteps: json['preparationSteps'] == null ? [] : json['preparationSteps'] as List,
        ingridientsParameters: (json['ingredientLines'] as List<dynamic>)
          .map((dynamic e) => Ingrident.fromJson(e as Map<String, dynamic>))
          .toList(),
        );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}