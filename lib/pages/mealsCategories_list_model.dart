// import 'package:cook_book_new/domain/entity/meal_categories.dart';
// import 'package:flutter/material.dart';
// import '../domain/api_client.dart';
//
// class MealsCategoriesModel extends ChangeNotifier {
//   final _apiClient = ApiClient();
//   final _mealsCategory = <MealCategories>[];
//
//   List<MealCategories> get meals => List.unmodifiable(_mealsCategory);
//
//   Future<void> loadMeals() async {
//     final mealsResponse = await _apiClient.MealCategorys();
//     _mealsCategory.addAll(mealsResponse.meals);
//     notifyListeners();
//   }
// }
//
// class NotifierProvider<MealsCategoriesModel extends ChangeNotifier> extends InheritedNotifier {
//   final MealsCategoriesModel model;
//
//   const NotifierProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );
//
//   static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.model;
//   }
//
//   static Model? read<Model extends ChangeNotifier>(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.widget;
//     return widget is NotifierProvider<Model> ? widget.model : null;
//   }
// }
