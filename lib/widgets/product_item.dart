import 'package:flutter/material.dart';
import 'package:water_shop_app/models/product.dart';
import 'package:water_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int shipping;
  final int price;
  // final Complexity complexity;
  // final Affordability affordability;

  ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.shipping,
    @required this.price,
    // @required this.complexity,
    // @required this.affordability,
  });

  // String get complexityText {
  //   switch (complexity) {
  //     case Complexity.Simple:
  //       return 'Simple';
  //       break;
  //     case Complexity.Challenging:
  //       return 'Challenging';
  //       break;
  //     case Complexity.Hard:
  //       return 'Hard';
  //       break;
  //     default:
  //       return 'Unknown';
  //   }
    // if(complexity == Complexity.Simple){
    //   return 'Simple';
    // }
    // if(complexity == Complexity.Challenging){
    //   return 'Challenging';
    // }
    // if(complexity == Complexity.Hard){
    //   return 'Hard';
    // }
  //}

  // String get affordabilityText {
  //   switch (affordability) {
  //     case Affordability.Affordable:
  //       return 'Affordable';
  //       break;
  //     case Affordability.Pricey:
  //       return 'Pricey';
  //       break;
  //     case Affordability.Luxurious:
  //       return 'Luxurious';
  //       break;
  //     default:
  //       return 'Unknown';
  //   }
  // }

  void selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: id,
    ).then((result) {
    if(result != null){
      //removeItem(result);
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.local_shipping_sharp),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$shipping days', style: TextStyle(fontFamily: 'AquinoDemo'),),
                    ],
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.work),
                  //     SizedBox(
                  //       width: 6,
                  //     ),
                  //     Text(complexityText),
                  //   ],
                  // ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.euro_outlined),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$price', style: TextStyle(fontFamily: 'AquinoDemo')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
