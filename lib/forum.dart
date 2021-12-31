import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invid19/providers/auth.dart';
import 'dart:convert';
import 'comment.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> fetchData() async {
    // const url = 'http://10.0.2.2:8000/diskusi/json/';
    const url = 'https://invid19.herokuapp.com/diskusi/json/';
    try {
      final response = await http.get(Uri.parse(url));
      List<dynamic> extractedData = jsonDecode(response.body);
      return extractedData;
    } catch (error) {
      return [];
    }
  }

  Widget getForumWidgets(List<dynamic> forumList, BuildContext context) {
    List<Widget> list = [
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Forum Diskusi',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.12);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForumForm())).then((value) {
                      setState(() {});
                    });
                  },
                  child: const Text('Create Forum',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ))),
            )
          ],
        ),
      ),
    ];
    for (var i = 0; i < forumList.length; i++) {
      var forum = forumList[i]['fields'];
      var title = forum['title'];
      var creator = forum['creator_username'];
      var desk = forum['message'];
      var waktu = forum['created_at'];
      var pk = forumList[i]['pk'];
      var gambar = "";

      if (forum['creator_image'] == 'profiles/default-user_pfzkxt') {
        gambar =
            'https://res.cloudinary.com/da66vxlpb/image/upload/v1/images/media/' +
                forum['creator_image'];
      } else {
        gambar = 'https://res.cloudinary.com/da66vxlpb/image/upload/v1/' +
            forum['creator_image'];
      }

      list.add(Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Comment(pk: pk, index: i)),
                );
                //  print('Card tapped.');
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(gambar),
                            radius: 20,
                          ),
                          const Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 50.0)),
                          Expanded(
                              child: Text(title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.justify)),
                        ],
                      ),
                      Text(creator + " - " + waktu,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.justify),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      Text(desk,
                          style: const TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ),
            ),
          )));
    }
    return ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Invid19'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> data) {
              if (data.connectionState == ConnectionState.done) {
                return getForumWidgets(data.data!, context);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

// ignore: must_be_immutable
class ForumForm extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  ForumForm({Key? key}) : super(key: key);

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

  postData(context, title, message) {
    // const url = 'http://10.0.2.2:8000/diskusi/add-api/';
    const url = 'https://invid19.herokuapp.com/diskusi/add-api/';
    try {
      var auth = Provider.of<Auth>(context, listen: false);
      if (!auth.isAuth) {
        throw const HttpException('Not have permission');
      }

      var token = auth.token;
      var userId = auth.userId;
      // print(userId);
      http.post(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
      }, body: {
        'title': title,
        'message': message,
        'user': '$userId',
      });
    } catch (error) {
      _showErrorDialog(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invid19"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
                  child: Text('Create Forum',
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
                    child: Text('Title',
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
                    controller: titleController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Put your title here ...",
                      hintStyle: const TextStyle(color: Colors.black38),
                      fillColor: Colors.white,
                      filled: true,
                      //           icon: Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title cannot be empty';
                      }
                      return null;
                    },
                  ),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Write your message ...",
                      hintStyle: const TextStyle(color: Colors.black38),
                      // labelText: "Message",
                      fillColor: Colors.white,
                      filled: true,
                      //      icon: Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Message cannot be empty';
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade800),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.blue.withOpacity(0.04);
                            }
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.12);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        postData(context, titleController.text,
                            messageController.text);
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
