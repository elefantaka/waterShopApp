import 'package:flutter/material.dart';
import 'package:water_shop_app/data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

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
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = PRODUCTS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.fitHeight),
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
                        selectedMeal.materials[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.materials.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}

//divider - small horizontal line
