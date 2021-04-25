import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
    );
  }
}
