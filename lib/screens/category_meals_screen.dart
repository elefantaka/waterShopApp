import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:water_shop_app/data.dart';
import 'package:water_shop_app/models/product.dart';

//import '../data.dart';
import '../widgets/meal_item.dart';
import 'package:water_shop_app/models/product.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Product> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Product> displayedMeals;
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
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            shipping: displayedMeals[index].shipping,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
