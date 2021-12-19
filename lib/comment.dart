import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Comment extends StatefulWidget {
  final int pk;
  final int index;
  const Comment({Key? key, required this.pk, required this.index})
      : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  var url_diskusi = "http://127.0.0.1:8000/diskusi/json/";
  var data_diskusi;
  var diskusi_i;

  var url_comment = "http://127.0.0.1:8000/comment/json/ ";
  var data_comment;
  var title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    int i = widget.index;
    var res_diskusi = await http.get(Uri.parse(url_diskusi));
    data_diskusi = jsonDecode(res_diskusi.body);
    diskusi_i = data_diskusi[i]['fields'];
    title =  diskusi_i['title'];
    

    var res_comment = await http.get(Uri.parse(url_comment));
    data_comment = jsonDecode(res_comment.body);


    setState(() {});
  }
 
  @override
  Widget build(BuildContext context) {
    var i   = widget.index+1;
    return Scaffold(
      appBar: AppBar(
        title: Text( "Diskusi " +  i.toString()),
      ),
      body: data_comment != null
        ? ListView.builder(itemCount: data_comment.length , itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data_comment[index]['fields']['message']),
                    onTap: () {},
                  );
                },

        

      )
      : Center()

    );
  }
}
