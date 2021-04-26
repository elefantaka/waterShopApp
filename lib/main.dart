import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/screens/contact_screen.dart';
import 'package:water_shop_app/screens/filters_screen.dart';
import 'package:water_shop_app/screens/category_products_screen.dart';
import 'package:water_shop_app/screens/product_detail_screen.dart';
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

  List<Product> _availableProducts = PRODUCTS;
  List<Product> _favouriteProducts = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableProducts = PRODUCTS.where((product)  {
        if(_filters['women'] == true && !product.isWomen){
          return false;
        }
        if(_filters['men'] == true && !product.isMen){
          return false;
        }
        if(_filters['color'] == true && !product.isColor){
          return false;
        }
        if(_filters['black'] == true && !product.isBlack){
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isProductFavourite(String id){
    return _favouriteProducts.any((product) => product.id == id);
  }

  void _toggleFavourite(String productId){
    final existingIndex = _favouriteProducts.indexWhere((product) => product.id == productId);
    if(existingIndex >= 0){
      setState(() {
        _favouriteProducts.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouriteProducts.add(PRODUCTS.firstWhere((product) => product.id == productId));
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
        '/': (ctx) => TabsScreen(_favouriteProducts),
        CategoryProductsScreen.routeName: (ctx) => CategoryProductsScreen(_availableProducts),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(_toggleFavourite, _isProductFavourite),
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
