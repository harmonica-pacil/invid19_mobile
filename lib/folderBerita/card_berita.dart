import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invid19/folderBerita/berita.dart';
//import 'detail_berita.dart';

Widget BeritaCard(BuildContext context, Berita berita) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              // backgroundColor: Colors.white,
              // Judul
              title: Text(
                berita.judulBerita,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              trailing: const SizedBox(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Penulis : ' + berita.penulis,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Tanggal Rilis : ' + berita.tanggalRilis,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          berita.isiBerita,
                          style:
                              TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
}
