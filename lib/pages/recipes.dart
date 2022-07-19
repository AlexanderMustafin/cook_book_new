import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/saladsCategories.dart';

class Recipe extends StatelessWidget {
  const Recipe({required this.index,super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        top: true,
        right: false,
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const RecipeAppBar(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(salads[index].imagePath),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Container( // body of App
                // width: (MediaQuery.of(context).size.width),
                  margin: const EdgeInsets.only(top: 250.0),
                  padding: const EdgeInsets.all(16.0),
                  height: 1000.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                child: Column(
                  children: <Widget> [
                    Text(
                      salads[index].name,
                      style: const TextStyle(color: Color(0xFF858585)),
                    ),
                    Container(

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RecipeAppBar({Key? key}) : super(key: key);

  @override
  State<RecipeAppBar> createState() => _RecipeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _RecipeAppBar extends State<RecipeAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: const Color(0x00ffffff),
      backgroundColor: const Color(0x3F000000),
      leading: const BackButton(
          color: Colors.white
      ),
      actions: const <Widget>[
        IconButton(
          padding: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.favorite_border, // TODO: Изменение состояния кнопки в зависимости от нажатия
            color: Colors.white,
          ),
          onPressed: null,
        ),
        IconButton(
          padding: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.shopping_cart, // TODO: Кастомный виджет, отображение счётчика добавленных продуктов
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}

//       trailing: Column(
//         children: const <Widget>[
//           Icon(Icons.timelapse_rounded),
//           Text(
//             '0 min',
//             style: TextStyle(color: Color(0xFF858585), fontSize: 12),
//           )
//         ],
//       ),
