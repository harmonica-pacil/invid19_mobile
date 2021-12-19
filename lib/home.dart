import 'package:flutter/material.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),

      //code untuk navbar
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://raw.githubusercontent.com/harmonica-pacil/invid19/master/static/images/logo.png",
                scale: 2,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'WELCOME TO INVID 19',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
