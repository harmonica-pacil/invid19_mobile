import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  var url = "http://invid19.herokuapp.com/diskusi/json";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    print(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forum"),
        ),
        body: data != null
            ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['pk'].toString()),
                  onTap: () {
                    
                  },
                  );
              },
              itemCount: data.length,
              
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              )));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}