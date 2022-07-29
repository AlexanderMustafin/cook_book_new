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
          padding: const EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited
                  ? const Icon(Icons.favorite_border)
                  : const Icon(Icons.favorite)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
      ],
    );
  }
}

class Salads extends StatefulWidget {
  const Salads({Key? key}) : super(key: key);

  @override
  State<Salads> createState() => _SaladsState();
}

class _SaladsState extends State<Salads> {
  //TODO Сделать избранное

  var _filteredSalads = <Salad>[];
  final _searchController = TextEditingController();

  void _searchRecipe() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredSalads = salads.where((Salad salad) {
        return salad.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredSalads = salads;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredSalads = salads;
    _searchController.addListener(_searchRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salads'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            itemCount: _filteredSalads.length,
            itemBuilder: (BuildContext context, int index) {
              final salad = _filteredSalads[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
<<<<<<< HEAD
                            builder: (context) => Recipe(i: index)));
=======
                            builder: (context) => Recipe(index: index)));
>>>>>>> 723620f112e8ffe40941c227045fd976b02c702e
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
                                  image: AssetImage(salad.imagePath)),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  salad.name,
                                  style: const TextStyle(fontSize: 22),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.timer),
                                    Text('${salad.cookTime} min')
                                  ],
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
<<<<<<< HEAD
                  borderSide: const BorderSide(
=======
                  borderSide: BorderSide(
>>>>>>> 723620f112e8ffe40941c227045fd976b02c702e
                    color: Colors.black12,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
