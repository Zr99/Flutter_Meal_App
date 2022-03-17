import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    
    if(!_loadedInitData){
      final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    }
    
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealID);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              removeItem: _removeMeal,
              id: displayedMeals![index].id as String,
              title: displayedMeals![index].title as String,
              imageURL: displayedMeals![index].imageUrl as String,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
              duration: displayedMeals![index].duration);
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
