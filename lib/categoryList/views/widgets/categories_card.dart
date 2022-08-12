import 'package:cook_book_new/recipeList/views/homeRecipePage.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String displayName;
  final String categoryImage;
  final String tag;

  CategoryCard({
    required this.displayName,
    required this.categoryImage,
    required this.tag,
  });
  @override
  Widget build(BuildContext context) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomePage(tag: tag, displayName: displayName)));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(categoryImage),
                  fit: BoxFit.cover,
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
                children: [
                  Container(
                    width: 130,
                    child: Text(displayName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito"
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
  }


