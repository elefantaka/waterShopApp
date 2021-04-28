import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:water_shop_app/widgets/main_drawer.dart';


//import '../data.dart';
import '../widgets/product_item.dart';
//import 'package:water_shop_app/models/product.dart';

class CategoryProductsScreen extends StatefulWidget {
  static const routeName = '/category-products';

  final List<Product> availableProducts;

  CategoryProductsScreen(this.availableProducts);

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String categoryTitle;
  List<Product> displayedProducts;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedProducts = widget.availableProducts.where((product) {
        return product.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId){
  //   setState(() {
  //     displayedProducts.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
        middle: Text(categoryTitle),
        //leading: MainDrawer(),
          )
        : AppBar(
            //backgroundColor: Colors.purpleAccent,
            title: Text(
              categoryTitle,
            ),
          );

    final pageBody = ListView.builder(
      itemBuilder: (ctx, index) {
        return ProductItem(
          id: displayedProducts[index].id,
          title: displayedProducts[index].title,
          imageUrl: displayedProducts[index].imageUrl,
          shipping: displayedProducts[index].shipping,
          price: displayedProducts[index].price,
          //complexity: displayedMeals[index].complexity,
          //affordability: displayedMeals[index].affordability,
        );
      },
      itemCount: displayedProducts.length,
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar,)
        : Scaffold(appBar: appBar, body: pageBody,);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       categoryTitle,
    //     ),
    //   ),
      // body: ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return ProductItem(
      //       id: displayedProducts[index].id,
      //       title: displayedProducts[index].title,
      //       imageUrl: displayedProducts[index].imageUrl,
      //       shipping: displayedProducts[index].shipping,
      //       price: displayedProducts[index].price,
      //       //complexity: displayedMeals[index].complexity,
      //       //affordability: displayedMeals[index].affordability,
      //     );
      //   },
      //   itemCount: displayedProducts.length,
      // ),
    //);
  }
}
