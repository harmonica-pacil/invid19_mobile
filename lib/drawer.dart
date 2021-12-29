import 'package:flutter/material.dart';
import 'package:invid19/folder-dataCovid/mainDataCovid.dart';
import 'package:invid19/folder-dataCovid/screens/homeDataCovid.dart';
import 'forum.dart';
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
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
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
