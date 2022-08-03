import 'package:cook_book_new/categoryList/views/homeCat.dart';
import 'package:cook_book_new/pages/recipe_card.dart';
import 'package:cook_book_new/recipeList/views/homeRecipePage.dart';
import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/DarkThemePreference.dart';
import 'package:provider/provider.dart';
import 'package:cook_book_new/pages/saladsCategories.dart';

import 'home_categories.dart';
// import 'package:cook_book_new/resources/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Image.asset('assets/img/menu.jpg'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favorites'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Shopping cart'),
              onTap: () {},
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              value: themeChange.darkTheme,
              onChanged: (value) {
                setState(() {
                  themeChange.darkTheme = value;
                });
              },
              secondary: const Icon(Icons.dark_mode_outlined),
            ),
          ])),
      appBar: AppBar(
        title: const Text('Cookbook'),
        centerTitle: true,
      ),
      body: HomeCategoryPage()
    );
  }


//   Widget _buildGradient() {
//     return Positioned.fill(
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: const [0.6, 0.95],
//           ),
//         ),
//       ),
//     );
//   }
}