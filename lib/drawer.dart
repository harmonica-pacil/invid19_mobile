import 'package:flutter/material.dart';
import 'package:invid19/folder-dataCovid/mainDataCovid.dart';
import 'package:invid19/folder-dataCovid/screens/homeDataCovid.dart';
import 'package:invid19/screens/home_vaksinasi.dart';
import 'forum.dart';
import 'package:invid19/folderBerita/home_berita.dart';
import 'folderArtikel/home_artikel.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

Drawer myDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'INVID 19',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
        ),
        ListTile(
          leading: Icon(Icons.forum),
          title: Text('Forum'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Forum()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.assessment_outlined),
          title: Text('Data Covid'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.article_outlined),
          title: Text('Artikel'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Artikel()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.my_library_books_outlined),
          title: Text('Berita'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homeBerita()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.health_and_safety_outlined ),
          title: Text('Vaksinasi'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeVaksinasi()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');

            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ],
    ),
  );
}
