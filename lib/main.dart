import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/screens/contact_screen.dart';
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
    'women': false,
    'men': false,
    'color': false,
    'black': false,
  };

  List<Product> _availableMeals = PRODUCTS;
  List<Product> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = PRODUCTS.where((meal)  {
        if(_filters['women'] == true && !meal.isWomen){
          return false;
        }
        if(_filters['men'] == true && !meal.isMen){
          return false;
        }
        if(_filters['color'] == true && !meal.isColor){
          return false;
        }
        if(_filters['black'] == true && !meal.isBlack){
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
        _favouriteMeals.add(PRODUCTS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purple,
        canvasColor: Color.fromRGBO(230, 230, 250, 1),
        fontFamily: 'AquinoDemo',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(153, 50, 204, 1)),
          body2: TextStyle(
            color: Color.fromRGBO(153, 50, 204, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'AquinoDemo',
            //fontWeight: FontWeight.bold,
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
        ContactScreen.routeName: (ctx) => ContactScreen(),
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
        title: Text('Water Shop'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
