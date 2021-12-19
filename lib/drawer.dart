import 'package:flutter/material.dart';


  Drawer myDrawer() {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
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
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.forum),
          title: Text('Forum'),
          onTap: (){} ,
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
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('bla bla'),
        ),
      ],
    ),
  );
  }


