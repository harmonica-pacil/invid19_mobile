import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:invid19/providers/auth.dart';
import 'package:provider/provider.dart';

class Comment extends StatefulWidget {
  final int pk;
  final int index;
  const Comment({Key? key, required this.pk, required this.index})
      : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  var url_diskusi = "http://invid19.herokuapp.com/diskusi/json/";
  var data_diskusi;
  var diskusi_i;

  var url_comment = "http://invid19.herokuapp.com/comment/json/";
  var data_comment;
  var title;
  var img_url = "https://res.cloudinary.com/da66vxlpb/image/upload/v1/";
  var img_url2 =
      "https://res.cloudinary.com/da66vxlpb/image/upload/v1/images/media/";

  get pk => widget.pk;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    int i = widget.pk;
    var res_diskusi = await http.get(Uri.parse(url_diskusi));
    data_diskusi = jsonDecode(res_diskusi.body);
    for (var j = 0; j < data_diskusi.length; j++) {
      if (data_diskusi[j]['pk'] == i) {
        diskusi_i = data_diskusi[j]['fields'];
        break;
      }
    }
    title = diskusi_i != null ? diskusi_i['title'] : " ";

    var res_comment = await http.get(Uri.parse(url_comment));
    data_comment = jsonDecode(res_comment.body);

    //removed unrelated comment
    data_comment
        .removeWhere((m) => m['fields']['id_forum'] != widget.pk.toString());

    setState(() {});
    print(data_diskusi);
    print(i.toString());
    print(title);
    print(data_comment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text("Diskusi " + "'" + title + "'") : Text(" "),
      ),
      body: data_comment != null
          ? ListView.builder(
              itemCount: data_comment.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: data_comment[index]['fields']
                                  ["creator_image"] ==
                              "profiles/default-user_pfzkxt"
                          ? NetworkImage(img_url2 +
                              data_comment[index]['fields']["creator_image"])
                          : NetworkImage(img_url +
                              data_comment[index]['fields']["creator_image"])
                      // .network(img_url + data_comment[index]['fields']["creator_image"]),

                      ),
                  title: Text(data_comment[index]['fields']['message']),
                  subtitle: Text(data_comment[index]['fields']
                          ['comment_creator_username'] +
                      " - " +
                      data_comment[index]['fields']['created_at']),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => formComment(pk:pk)),
          );
        },
        child: Icon(Icons.add_comment_rounded),
      ),
    );
  }
}

class formComment extends StatefulWidget {
  int pk;

  formComment({Key? key, required this.pk}) : super(key: key);


  @override
  State<formComment> createState() => _formCommentState();
}

class _formCommentState extends State<formComment> {


  TextEditingController messageController = TextEditingController();

  get pk => widget.pk;



  void _showErrorDialog(context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  postData(context, message) {
    // const url = 'http://127.0.0.1:8000/comment/flutter/';
    const url = 'https://invid19.herokuapp.com/comment/flutter/';
    try {
      var auth = Provider.of<Auth>(context, listen: false);
      if (!auth.isAuth) {
        throw const HttpException('Permission Denied');
      }
      print(!auth.isAuth);
      var token = auth.token;
      var userId = auth.userId;

      http.post(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
      }, body: {
        'message': message,
        'user': '$userId',
        'id': pk.toString(),
      });
    } catch (error) {
      _showErrorDialog(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post a comment")),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
                  child: Text('Create Comment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.white,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Message',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: messageController,
                    maxLines: 10,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Input your comment here...",
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Message empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        postData(context, messageController.text);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
