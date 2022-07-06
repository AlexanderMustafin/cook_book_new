import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

class Salads extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salads'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Salsa'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Salsa())
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Perigorskiy salat'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Merkury'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Grecheskiy'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Salat with chiken'),
            onTap: () {},
          ),
        ],
      )
    );
  }
}
