import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: Center(
        child: Text("The Recipes for the Category!"),
      ),
    );
  }
}
