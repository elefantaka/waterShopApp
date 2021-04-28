import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_shop_app/screens/category_products_screen.dart';
import 'package:water_shop_app/widgets/cupertino_switch_list_tile.dart';
import 'package:water_shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _women = false;
  bool _black = false;
  bool _color = false;
  bool _men = false;

  @override
  initState() {
    _women = widget.currentFilters['women'];
    _men = widget.currentFilters['men'];
    _color = widget.currentFilters['color'];
    _black = widget.currentFilters['black'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, bool currentValue, Function updateValue) {
    return Platform.isIOS
        ? new CupertinoSwitchListTile(
            title: Text(title, style: TextStyle(fontFamily: 'AquinoDemo')),
            value: currentValue,
            //subtitle: Text(description),
            onChanged: updateValue,
          )
        : SwitchListTile(
            title: Text(title, style: TextStyle(fontFamily: 'AquinoDemo')),
            value: currentValue,
            //subtitle: Text(description),
            onChanged: updateValue,
          );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Filters'),
            leading: GestureDetector(
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(CupertinoIcons.left_chevron),
                      onPressed: () => Navigator.of(context).pop(CategoryProductsScreen.routeName),
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.doc),
                      onPressed: () {
                        final selectedFilters = {
                          'women': _women,
                          'men': _men,
                          'color': _color,
                          'black': _black,
                        };
                        widget.saveFilters(selectedFilters);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        : AppBar(
            title: Text('Filters'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'women': _women,
                    'men': _men,
                    'color': _color,
                    'black': _black,
                  };
                  widget.saveFilters(selectedFilters);
                },
              ),
            ],
          );

    final bodyPage = Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Product Selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Women',
                _women,
                    (newValue) {
                  setState(
                        () {
                      _women = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Men',
                _men,
                    (newValue) {
                  setState(
                        () {
                      _men = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Black',
                _black,
                    (newValue) {
                  setState(
                        () {
                      _black = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Color',
                _color,
                    (newValue) {
                  setState(
                        () {
                      _color = newValue;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
    return Platform.isIOS
    ? CupertinoPageScaffold(navigationBar: appBar, child: bodyPage,)
        : Scaffold(appBar: appBar, body: bodyPage);
    // AppBar(
      //   title: Text('Filters'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.save),
      //       onPressed: () {
      //         final selectedFilters = {
      //           'women': _women,
      //           'men': _men,
      //           'color': _color,
      //           'black': _black,
      //         };
      //         widget.saveFilters(selectedFilters);
      //       },
      //     ),
      //   ],
      // ),
      //drawer: MainDrawer(),

        //Column(
      //   children: <Widget>[
      //     Container(
      //       padding: EdgeInsets.all(20),
      //       child: Text(
      //         'Product Selection',
      //         style: Theme.of(context).textTheme.title,
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView(
      //         children: <Widget>[
      //           _buildSwitchListTile(
      //             'Women',
      //             _women,
      //             (newValue) {
      //               setState(
      //                 () {
      //                   _women = newValue;
      //                 },
      //               );
      //             },
      //           ),
      //           _buildSwitchListTile(
      //             'Men',
      //             _men,
      //             (newValue) {
      //               setState(
      //                 () {
      //                   _men = newValue;
      //                 },
      //               );
      //             },
      //           ),
      //           _buildSwitchListTile(
      //             'Black',
      //             _black,
      //             (newValue) {
      //               setState(
      //                 () {
      //                   _black = newValue;
      //                 },
      //               );
      //             },
      //           ),
      //           _buildSwitchListTile(
      //             'Color',
      //             _color,
      //             (newValue) {
      //               setState(
      //                 () {
      //                   _color = newValue;
      //                 },
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
  }
}
