import 'dart:convert';

import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  // ignore: use_key_in_widget_constructors
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final shortIntroController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  var _isLoading = false;

  Future<Map<String, dynamic>> getData() async {
    String? token = Provider.of<Auth>(context, listen: false).token;
    String? username = Provider.of<Auth>(context, listen: false).username;
    print('tokenn');
    print(token);
    var res = await http.post(
      Uri.parse('https://invid19.herokuapp.com/api/user/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + (token ?? ''),
      },
      body: jsonEncode({
        'username': username,
      }),
    );

    print(json.decode(res.body));
    var data = json.decode(res.body)[0]['fields'] as Map<String, dynamic>;
    print(data);
    return data;
  }

  Future<void> _update() async {
    setState(() {
      _isLoading = true;
    });
    String? token = Provider.of<Auth>(context, listen: false).token;
    String? username = Provider.of<Auth>(context, listen: false).username;

    var res = await http.post(
      Uri.parse('https://invid19.herokuapp.com/api/user/update-profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + (token ?? ''),
      },
      body: json.encode({
        'username': username,
        'name': nameController.text,
        'bio': bioController.text,
        'address': addressController.text,
        'short_intro': shortIntroController.text,
        'email': emailController.text,
      }),
    );

    var data = json.decode(res.body);

    if (data['success'] != null) {
      setState(() {});
    } else {
      // show error message flutter toast
      Fluttertoast.showToast(
        msg: 'Gagal mengupdate profile',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    shortIntroController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),

      //code untuk navbar
      drawer: myDrawer(context),
      body: FutureBuilder(
        future: getData(),
        builder: (ctx, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }

          String username =
              (snapshot.data as Map<String, dynamic>)['username'] ?? '';
          String email = (snapshot.data as Map<String, dynamic>)['email'] ?? '';
          String name = (snapshot.data as Map<String, dynamic>)['name'] ?? '';
          String bio = (snapshot.data as Map<String, dynamic>)['bio'] ?? '';
          String address =
              (snapshot.data as Map<String, dynamic>)['address'] ?? '';
          String shortIntro =
              (snapshot.data as Map<String, dynamic>)['short_intro'] ?? '';

          nameController.text = name;
          bioController.text = bio;
          shortIntroController.text = shortIntro;
          addressController.text = address;
          emailController.text = email;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'My Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 20),
                ),
                Text(
                  'Username: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    initialValue: username,
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                    enabled: false,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  'Fullname: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Fullname',
                    ),
                    enabled: true,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  'Email: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    enabled: false,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  'Bio: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    controller: bioController,
                    decoration: InputDecoration(
                      hintText: 'Bio',
                    ),
                    enabled: true,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  'Address: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: 'Address',
                    ),
                    enabled: true,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  'Short Intro: ',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: TextFormField(
                    controller: shortIntroController,
                    decoration: InputDecoration(
                      hintText: 'Short Intro',
                    ),
                    enabled: true,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: _update,
                    child: Text('Edit Profile'),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
