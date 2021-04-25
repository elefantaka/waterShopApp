import 'package:flutter/material.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Product> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text('You have no favourites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            shipping: favouriteMeals[index].shipping,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
