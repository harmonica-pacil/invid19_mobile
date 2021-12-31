import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget popupDialog(BuildContext context) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check_circle_outline, size:30),
        SizedBox(height: 10),
        Text("Berita baru telah ditambahkan")
      ],
    ),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Tutup", style: TextStyle(color: Colors.blue.shade100)))
    ],
  );
}

Widget warningPopup(BuildContext context) {
  return AlertDialog(
    title: Column(
      children: <Widget>[Text("Form berita belum lengkap")],
    ),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:Text("TUTUP", style: TextStyle(color: Colors.blue.shade100),))
    ],
  );
}
