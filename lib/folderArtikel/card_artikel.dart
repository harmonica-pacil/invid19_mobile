import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invid19/folderArtikel/models.dart';
import 'detail_artikel.dart';

Widget ArticleCard(BuildContext context, Article article) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: Card(
        color: Colors.white.withOpacity(0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.network(
                article.images,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 5.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article.judul,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      article.deskripsi.length > 100
                          ? article.deskripsi.substring(0, 99) + "..."
                          : article.deskripsi,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15, color: Colors.white.withOpacity(0.7)),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      article.tanggal,
                      style: TextStyle(
                          fontSize: 14.5, color: Colors.white.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
                alignment: Alignment.topRight,
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              detailArtikel(artikel: article)));
                },
                icon: const Icon(Icons.read_more))
          ],
        )),
  );
}
