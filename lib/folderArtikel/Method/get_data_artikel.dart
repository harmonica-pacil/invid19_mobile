import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';

Future<List<Article>> getArticle(String query) async {
  var url = Uri.parse('http://invid19.herokuapp.com/artikel/search_flutter?article=$query');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json"
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Article> artikel = [];
  for (var q in data) {
    if (q != null) {
      artikel.add(Article.fromJson(q));
    }
  }
  return artikel;
}
