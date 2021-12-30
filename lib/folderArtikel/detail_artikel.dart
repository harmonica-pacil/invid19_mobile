import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'package:invid19/drawer.dart';

class detailArtikel extends StatelessWidget {
  static const route = '/detail_artikel';

  final Article artikel;
  
  const detailArtikel({Key?key, required this.artikel}) : super(key:key);

  @override
  Widget build(BuildContext context){
    final topContent = Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 10.0),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(artikel.images),
            fit: BoxFit.cover
          )

        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.all(40.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0),
              Text(artikel.judul,
                  style: TextStyle(color: Colors.white, fontSize: 45.0)),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      flex: 9,
                      child: Text("Ditinjau oleh: " + artikel.peninjau, style: TextStyle(fontSize: 15))),
                  Expanded(
                    flex: 3, 
                    child: Text(artikel.tanggal, textAlign: TextAlign.left, style: TextStyle(fontSize: 15))
                  )
                ],
              )
            ],
          ),
        )),
      Positioned(
        left: 8.0,
        top: 60.0,
        child: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
            }
        )
      )
    ]
  );

  final bottomContent = Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(30.0),
    child: Text(artikel.deskripsi, textAlign: TextAlign.justify, style: TextStyle(fontSize: 20))
  );

  return Scaffold(
    appBar: AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'ARTIKEL INVID 19',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 10)
      ]),
    ),
    drawer: myDrawer(context),
    body: new SingleChildScrollView(
      child: Column(children: <Widget>[
        topContent,
        bottomContent
      ]
      )
    )
  );
  }
  
}
