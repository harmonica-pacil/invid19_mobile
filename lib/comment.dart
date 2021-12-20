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

  var url_comment = "http://127.0.0.1:8000/comment/json/";
  var data_comment;
  var title;
  var img_url = "https://res.cloudinary.com/da66vxlpb/image/upload/v1/";

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
    title = diskusi_i['title'];

    var res_comment = await http.get(Uri.parse(url_comment));
    data_comment = jsonDecode(res_comment.body);

    //removed unrelated comment
    data_comment
        .removeWhere((m) => m['fields']['id_forum'] != widget.pk.toString());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var i = widget.index + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Diskusi " + i.toString()),
      ),
      body: data_comment != null
          ? ListView.builder(
              itemCount: data_comment.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(img_url +
                          data_comment[index]['fields']["creator_image"])
                      // .network(img_url + data_comment[index]['fields']["creator_image"]),

                      ),
                  title: Text(data_comment[index]['fields']['message']),
                  subtitle: Text(data_comment[index]['fields']
                      ['comment_creator_username']),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
      ),
    );
  }
}
