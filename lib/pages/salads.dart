import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/recipes.dart';

// import 'package:cook_book_new/pages/home.dart';
import 'package:cook_book_new/pages/saladsCategories.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited
                  ? Icon(Icons.favorite_border)
                  : Icon(Icons.favorite)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
      ],
    );
  }
}

class Salads extends StatelessWidget {
  const Salads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salads'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: salads.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Recipe(index: index)));
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(salads[index].imagePath)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              salads[index].name,
                              style: TextStyle(fontSize: 22),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.timer),
                                  Text('${salads[index].cookTime} min')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const FavoriteWidget(),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
