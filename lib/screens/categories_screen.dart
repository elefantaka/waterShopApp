import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 200,
      //   childAspectRatio: 3 / 2,
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      // ),
    );
  }
}
