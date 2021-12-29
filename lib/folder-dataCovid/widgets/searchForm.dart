import 'package:flutter/material.dart';
import 'package:invid19/folder-dataCovid/models/card_provinsi.dart';

// Widget hasilCariProvinsi(BuildContext context, Provinsi hasilSearch) {
//     return Card(

//       // child: Column(children: [Text("KASUS MENINGGAL",
//       // style: TextStyle(fontSize: 20, fontWeight : FontWeight.bold), textAlign: TextAlign.center],),

//     );
//   }

Widget buildSearchProvinsi(BuildContext context, Provinsi hasilSearch) {
  return Center(
    child: Card(
      child: SizedBox(
        width: 500,
        height: 320,
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            Text("Kasus Covid-19 di Provinsi " + hasilSearch.namaProvinsi,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
              height: 25,
            ),
            Text("KASUS POSITIF",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
              height: 5,
            ),
            Text(hasilSearch.kasusPositif,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Container(
              height: 15,
            ),
            Text("KASUS SEMBUH",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
              height: 5,
            ),
            Text(hasilSearch.kasusSembuh,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Container(
              height: 15,
            ),
            Text("KASUS MENINGGAL",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
              height: 5,
            ),
            Text(hasilSearch.kasusMeninggal,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Container(
              height: 15,
            ),
          ],
        ),

        // Text(),
        // Text(),
        // Text(),
        // Text(),
        // Text(),
      ),
    ),
  );
}
