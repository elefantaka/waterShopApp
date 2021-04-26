import 'package:flutter/material.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/widgets/product_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Product> favouriteProducts;

  FavouritesScreen(this.favouriteProducts);

  @override
  Widget build(BuildContext context) {
    if(favouriteProducts.isEmpty){
      return Center(
        child: Text('You have no favourites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductItem(
            id: favouriteProducts[index].id,
            title: favouriteProducts[index].title,
            imageUrl: favouriteProducts[index].imageUrl,
            shipping: favouriteProducts[index].shipping,
            price: favouriteProducts[index].price,
            // complexity: favouriteMeals[index].complexity,
            // affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteProducts.length,
      );
    }
  }
}
