import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String? get userId {
    return _userId;
  }

  Future<void> signup(String username, String firstname, String lastname,
      String password) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/user/create');
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
            'last_name': lastname,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['username'] != null) {
        throw HttpException(responseData['username'][0]);
      }

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void logout() {
    _token = null;
    _userId = null;

    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse('http://10.0.2.2:8000/api-token-auth/');
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

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
