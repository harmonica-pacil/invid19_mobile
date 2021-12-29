import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';

Future<String> addArticle(Article artikel) async {
  var url =
      Uri.parse('http://invid19.herokuapp.com/artikel/add_flutter?article=$artikel');
  var response = await http.post(url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(artikel));
  return "";
}
