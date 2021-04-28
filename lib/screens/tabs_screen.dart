import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/screens/categories_screen.dart';
import 'package:water_shop_app/screens/contact_screen.dart';
import 'package:water_shop_app/screens/favourites_screen.dart';
import 'package:water_shop_app/screens/filters_screen.dart';
import 'package:water_shop_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Product> favouriteProducts;

  TabsScreen(this.favouriteProducts);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
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

  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages  = [
      {'page': CategoriesScreen(), 'title': 'Water Shop'},
      {'page': FavouritesScreen(widget.favouriteProducts), 'title': 'Your Favourite'},
      //{'page': FiltersScreen(_setFilters, _filters), 'title': 'Filters'},
      {'page': ContactScreen(), 'title': 'Contact'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      //Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(_pages[_selectedPageIndex]['title']),
            leading: GestureDetector(
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(CupertinoIcons.arrow_right_arrow_left),
                      onPressed: () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
                    ),
                  ],
                ),
              ),
            ),
          )
        : AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.sync_alt),
                onPressed: () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
              ),
            ],
          );

    return Scaffold(
      appBar: appBar,
      // AppBar(
      //   title: Text(_pages[_selectedPageIndex]['title']),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.sync_alt),
      //       onPressed: () =>  Navigator.of(context).pushNamed(FiltersScreen.routeName),
      //     ),
      //   ],
      // ),
      //drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Platform.isIOS
          ? CupertinoTabBar(onTap: _selectPage,
        //backgroundColor: Colors.blue, //Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex, items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            icon: Icon(CupertinoIcons.circle_grid_3x3),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(CupertinoIcons.star),
            title: Text('Favourites'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(CupertinoIcons.person_crop_rectangle),
            title: Text('Contact'),
          ),
        ],)
          : BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blue,
        //Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme
            .of(context)
            .accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.contact_phone),
            title: Text('Contact'),
          ),
        ],
      ),
    // BottomNavigationBar(
    //     onTap: _selectPage,
    //     backgroundColor: Colors.blue, //Theme.of(context).primaryColor,
    //     unselectedItemColor: Colors.white,
    //     selectedItemColor: Theme.of(context).accentColor,
    //     currentIndex: _selectedPageIndex,
    //     //type: BottomNavigationBarType.shifting,
    //     items: [
    //       BottomNavigationBarItem(
    //         backgroundColor: Theme.of(context).primaryColor,
    //         icon: Icon(Icons.category),
    //         title: Text('Categories'),
    //       ),
    //       BottomNavigationBarItem(
    //         //backgroundColor: Theme.of(context).primaryColor,
    //         icon: Icon(Icons.star),
    //         title: Text('Favourites'),
    //       ),
    //         BottomNavigationBarItem(
    //           //backgroundColor: Theme.of(context).primaryColor,
    //           icon: Icon(Icons.contact_phone),
    //           title: Text('Contact'),
    //       ),
    //     ],
    //   ),
    );
  }
}

//       BottomNavigationBarItem(
//
//         //backgroundColor: Theme.of(context).primaryColor,
//         icon: Icon(Icons.sync_alt),
//         title: Text('Filters'),
// ),