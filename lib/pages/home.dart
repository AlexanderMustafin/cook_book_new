import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/salads.dart';
import 'package:cook_book_new/pages/DarkThemePreference.dart';
import 'package:provider/provider.dart';
// import 'package:cook_book_new/resources/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('Favorites'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag_outlined),
          title: Text('Shopping cart'),
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
        backgroundColor: Colors.amber,
        title: Text('Cookbook'),
        centerTitle: true,
      ),
    body: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Salads()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/salad.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Salads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),

        InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Salads()),
          //   );
          // },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/snacks.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Snacks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),

        InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Salads()),
          //   );
          // },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/soup.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'First Meal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),


        InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Salads()),
          //   );
          // },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/second_meal.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Second Meal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),


        InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Salads()),
          //   );
          // },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/fish_meal.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Fish Meal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),


        InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Salads()),
          //   );
          // },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/img/breakfast.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Breakfast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),

      ],
    ),

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
