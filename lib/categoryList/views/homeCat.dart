import 'package:cook_book_new/categoryList/model/categories.api.dart';
import 'package:cook_book_new/categoryList/model/categories.dart';
import 'package:cook_book_new/categoryList/views/widgets/categories_card.dart';
import 'package:flutter/material.dart';


class HomeCategoryPage extends StatefulWidget {
  @override
  State<HomeCategoryPage> createState() => _HomeCategoryPageState();
}

class _HomeCategoryPageState extends State<HomeCategoryPage> {
  List<Category> _categories;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    _categories = await CategoryApi.getCategory();
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                 primary: false,
                padding: const EdgeInsets.all(20),

                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 200.0,
                  crossAxisSpacing: 10,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                      displayName: _categories[index].displayName,
                      categoryImage: _categories[index].iconImage,
                      tag: _categories[index].tag,
                  );
                },
              ),
            );
  }
}


