import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _username;
  int? _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    return _token;
  }

  int? get userId {
    return _userId;
  }

  String? get username {
    return _username;
  }

  Future<void> signup(
      String username, String email, String firstname, String password) async {
    final url = Uri.parse('https://invid19.herokuapp.com/api/user/create');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'username': username,
            'first_name': firstname,
            'password': password,
            'email': email
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['username'] != null) {
        if (responseData['username'][0] != null &&
            (responseData['username'][0] as String).contains('already exists'))
          throw HttpException(responseData['username'][0]);
      }
      if (responseData['email'] != null) {
        if (responseData['email'][0] != null &&
            (responseData['email'][0] as String).contains('already exists'))
          throw HttpException(responseData['email'][0]);
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void logout() {
    _token = null;
    _username = null;
    _userId = null;

    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse('https://invid19.herokuapp.com/api-token-auth/');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'username': username,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['non_field_errors'] != null) {
        throw HttpException(responseData['non_field_errors'][0]);
      }
      _token = responseData['token'];

      if (_token == null) {
        throw HttpException('Could not login');
      }

      final urlGetUser =
          Uri.parse('https://invid19.herokuapp.com/api/user/get');
      final responseGetUser = await http.post(
        urlGetUser,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ${_token}',
        },
        body: json.encode(
          {
            'username': username,
          },
        ),
      );

      final responseDataGetUser = json.decode(responseGetUser.body);

      _username = responseDataGetUser['username'];
      _userId = responseDataGetUser['userId'];
      print('useriddd');
      print(_userId);

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
