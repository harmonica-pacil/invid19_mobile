import 'package:flutter/material.dart';
import 'package:invid19/drawer.dart';
// import 'package:invid19/folder-dataCovid/screens/data_covid.dart';
import 'package:invid19/folder-dataCovid/screens/homeDataCovid.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Invid19',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: const MyHomePage(title: 'Invid19'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Covid"),
      ),
      drawer: myDrawer(context),
      body: SingleChildScrollView(child: HomeIsYou()),
    );
  }
}
