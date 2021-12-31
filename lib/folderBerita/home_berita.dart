import 'package:flutter/material.dart';
import 'package:invid19/folderBerita/berita.dart';
import 'package:invid19/folderBerita/get_berita.dart';
import 'package:invid19/folderBerita/card_berita.dart';
import 'package:invid19/folderBerita/form_add_berita.dart';
import 'package:invid19/drawer.dart';

class homeBerita extends StatefulWidget {
  const homeBerita({Key? key}) : super(key: key);

  @override
  _homeBeritaState createState() => _homeBeritaState();
}

class _homeBeritaState extends State<homeBerita> {
  String qsBerita = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'BERITA INVID 19',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 10)
          ]),
        ),
        drawer: myDrawer(context),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(left: 25, top: 15, bottom: 13),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     child: SizedBox(
            //       width: 280,
            //       height: 50,
            //       child: TextField(
            //           style: TextStyle(color: Colors.black, fontSize: 19),
            //           cursorColor: Colors.black54,
            //           onChanged: (value) => {
            //                 setState(
            //                   () {
            //                     qsBerita = value;
            //                   },
            //                 )
            //               },
            //           decoration: InputDecoration(
            //             prefixIcon: Icon(Icons.search, color: Colors.black),
            //             filled: true,
            //             fillColor: Colors.white,
            //             border: OutlineInputBorder(
            //                 borderSide:
            //                     BorderSide(color: Colors.blue, width: 0),
            //                 borderRadius: BorderRadius.circular(10)),
            //             hintText: 'Cari Artikel',
            //             hintStyle:
            //                 TextStyle(color: Colors.black38, fontSize: 16),
            //           )
            //           ),
            //     ),
            //   ),
            // ),
            Spacer(),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: RawMaterialButton(
                  constraints: BoxConstraints.tight(Size(45, 45)),
                  elevation: 0.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormAddBerita()));
                  },
                  shape: CircleBorder(),
                )),
          ]),
          Expanded(
              child: FutureBuilder<List<Berita>>(
            future: getBerita(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Berita>? berita = snapshot.data;
                if (berita?.isNotEmpty ?? false) {
                  return ListView.builder(
                      itemCount: berita?.length,
                      itemBuilder: (context, index) {
                        return BeritaCard(context, berita![index]);
                      });
                } else {
                  return Text('Tidak ada artikel dengan judul " ' + qsBerita + ' "');
                }
              } else {
                return SizedBox(
                  height:5, 
                  width:5, 
                  child: Center(
                    child:CircularProgressIndicator())
                  );
              }
            },
          ))
        ]));
  }
}
