import 'package:flutter/material.dart';
import 'package:water_shop_app/widgets/main_drawer.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';

  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          //fontFamily: 'AquinoDemo',
          fontSize: 20,

          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      drawer: MainDrawer(),
        body: Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Contact us!',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 174, 201, 1),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 180,
            width: 400,
            child: Column(
              children: <Widget>[
                buildListTile('666-666-666', Icons.phone),
                buildListTile('watershop@gmail.com', Icons.email),
                buildListTile('watershop.com', Icons.web),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
// height: 300,
// decoration: BoxDecoration(color: Colors.indigoAccent),
// child