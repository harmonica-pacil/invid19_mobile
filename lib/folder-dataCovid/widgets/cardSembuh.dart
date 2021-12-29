import 'package:flutter/material.dart';

class CardCovidSembuh extends StatefulWidget {
  const CardCovidSembuh({Key? key}) : super(key: key);

  @override
  _CardCovidSembuh createState() => _CardCovidSembuh();
}

class _CardCovidSembuh extends State<CardCovidSembuh> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 200,
            color: Colors.green,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    Container(
                      height: 20,
                    ),
                    Text(
                      'KASUS SEMBUH',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      "4.098.178",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
