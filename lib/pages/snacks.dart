import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

class Snacks extends StatelessWidget {
  const Snacks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Row(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(
                      recipes[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    children: [
                      Text(recipes[index].name, style: const TextStyle(fontSize: 22)),
                      Text("${recipes[index].cookTime} минут", style: const TextStyle(fontSize: 18)),
                    ],
                  )
                ]
              ),
            );
          }
      ),
    );
  }
}

class Recipes{
  const Recipes({
     this.name,
     this.cookTime,
     this.imagePath,
});

  final String name;
  final int cookTime;
  final String imagePath;
}

const recipes = [
  // Recipes(name: "French Fries", cookTime: 12, imagePath: "assets/img/snacks_french_fries.jpg"),
  // Recipes(name: "Nuggets", cookTime: 20, imagePath: "assets/img/snacks_nuggets.webp"),
  Recipes(name: "French Fries", cookTime: 12, imagePath: "assets/img/soup.jpg"),
  Recipes(name: "Nuggets", cookTime: 20, imagePath: "assets/img/soup.jpg"),
];