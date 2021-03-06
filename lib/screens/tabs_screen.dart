import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>>? _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'pages': CategoriesScreen(), 'title': 'Categories'},
      {
        'pages': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //For Shifting animation needs to add
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
