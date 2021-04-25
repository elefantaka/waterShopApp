import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/meal.dart';
import 'package:water_shop_app/screens/filters_screen.dart';
import 'file:///C:/Work/flutterUdemy/water_shop_app/lib/screens/category_meals_screen.dart';
import 'package:water_shop_app/screens/meal_detail_screen.dart';
import 'package:water_shop_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal)  {
        if(_filters['gluten'] == true && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] == true && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian'] == true && !meal.isVegetarian){
          return false;
        }
        if(_filters['vegan'] == true && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String id){
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  void _toggleFavourite(String mealId){
    final existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.purple,
        canvasColor: Color.fromRGBO(230, 230, 250, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(153, 50, 204, 1)),
          body2: TextStyle(
            color: Color.fromRGBO(153, 50, 204, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   //return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (setting){
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
