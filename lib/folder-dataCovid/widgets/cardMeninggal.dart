import 'package:flutter/material.dart';

class CardCovidMeninggal extends StatefulWidget {
  const CardCovidMeninggal({Key? key}) : super(key: key);

  @override
  _CardCovidMeninggal createState() => _CardCovidMeninggal();
}

class _CardCovidMeninggal extends State<CardCovidMeninggal> {
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
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    Container(
                      height: 20,
                    ),
                    Text(
                      'KASUS MENINGGAL',
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
                      "143.659",
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
