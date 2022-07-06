import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/salads.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Cook book'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading:
                Image.asset("assets/img/salad.jpg",
                    width: 70,
                    height: 100),
            title: Text('Salads'),
            subtitle: Text('Кол-во предложений'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Salads()),
              );
            },
          ),
          ListTile(
            leading:
                Image.asset("assets/img/snacks.jpg",
                    width: 70,
                    height: 100),
            title: Text('Snacks, sandwiches'),
            subtitle: Text('Кол-во предложений'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/img/soup.jpg",
                width: 70,
                height: 100),
            title: Text('First meal'),
            subtitle: Text('Кол-во предложений'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/img/second_meal.jpg",
                width: 70,
                height: 100),
            title: Text('Second meal'),
            subtitle: Text('Кол-во предложений'),
            onTap: () {},
          ),
          ListTile(
            leading:
                Image.asset("assets/img/fish_meal.jpg",
                    width: 70,
                    height: 100),
            title: Text('Fish meals'),
            subtitle: Text('Кол-во предложений'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
