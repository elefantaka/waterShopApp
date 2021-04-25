import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Product {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  //final List<String> materials1;
  final List<String> materials;
  final int shipping;
  final int price;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Product({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    //@required this.materials1,
    @required this.materials,
    @required this.shipping,
    @required this.price,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
