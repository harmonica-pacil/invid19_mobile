import 'package:flutter/material.dart';
import '../models/vaksin.dart';
import '../widgets/card_vaksin.dart';
import '../screens/add_vaksinasi.dart';
import '../widgets/carousel_vaksin.dart';
import '../methods/vaksinasi_method.dart';
import 'package:invid19/drawer.dart';


class HomeVaksinasi extends StatefulWidget {
  const HomeVaksinasi({Key? key}) : super(key: key);

  @override
  _HomeVaksinasi createState() => _HomeVaksinasi();
}

class _HomeVaksinasi extends State<HomeVaksinasi> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Vaksinasi",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontWeight: FontWeight.bold),
            
          ),
        ),
        drawer: myDrawer(context),
        body: 
        SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const VaksinasiCarousel(),
        SizedBox(height: 18),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Vaksinasi COVID-19",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 32, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Anda dapat mendaftarkan jadwal vaksinasi di sini",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
          ),
        ),
        Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: TextButton(
                          child: const Text(
                            "Buat Vaksinasi",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.indigo[400]),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddVaksinasi(),
                              ),
                            );
                          },
                        ),
                      ),
        SizedBox(height: 18),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Lihat daftar vaksinasi COVID-19 terkini",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
          ),
        ),
        FutureBuilder<List<Vaksin>>(
          future: getVaksinasi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Vaksin>? article = snapshot.data;
              if (article?.isNotEmpty ?? false) {
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: article?.length,
                  itemBuilder: (context, index) {
                    return VaksinasiCard(
                      context,
                      article![index],
                    );
                  },
                );
              } else {
                return const Text(
                  "Tidak ada jadwal vaksinasi yang ditampilkan",
                );
              }
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            } else {
              return const Text(
                "Loading...",
              );
            }
          },
        ),
        SizedBox(height: 12),
      ]),
    ));
  }
  
}

