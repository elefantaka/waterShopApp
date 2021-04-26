import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  ProductDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 100,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct = PRODUCTS.firstWhere((product) => product.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedProduct.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(selectedProduct.imageUrl, fit: BoxFit.fitHeight),
            ),
            //buildSectionTitle(context, 'Ingrediets'),
            // buildContainer(
            //   ListView.builder(
            //     itemBuilder: (ctx, index) => Card(
            //       color: Colors.indigoAccent,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //         child: Text(
            //           selectedMeal.materials1[index],
            //         ),
            //       ),
            //     ),
            //     itemCount: selectedMeal.materials1.length,
            //   ),
            // ),
            buildSectionTitle(context, 'Materials'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(
                        selectedProduct.materials[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedProduct.materials.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(productId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(productId),
      ),
    );
  }
}

//divider - small horizontal line
