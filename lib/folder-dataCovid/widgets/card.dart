import 'package:flutter/material.dart';

class CardCovidPositf extends StatefulWidget {
  const CardCovidPositf({Key? key}) : super(key: key);

  @override
  _CardCovidPositf createState() => _CardCovidPositf();
}

class _CardCovidPositf extends State<CardCovidPositf> {
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
            color: Colors.red,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    Container(
                      height: 20,
                    ),
                    Text(
                      'KASUS POSITIF',
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
                      "4.250.855",
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
