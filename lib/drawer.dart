import 'package:flutter/material.dart';
import 'forum.dart';
import 'folderArtikel/home_artikel.dart';

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
          onTap: () {},
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
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
        ),
      ],
    ),
  );
}
