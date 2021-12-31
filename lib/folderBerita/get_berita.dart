import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:invid19/folderBerita/berita.dart';

Future<List<Berita>> getBerita() async {
  var url = Uri.parse('https://invid19.herokuapp.com/berita/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json"
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Berita> berita = [];
  for (var q in data) {
    if (q != null) {
      berita.add(Berita.fromJson(q));
    }
  }
  return berita;
}

Future<String> addBerita(Berita berita) async {
  var url =
      Uri.parse('https://invid19.herokuapp.com/berita/buat_berita_flutter');
  var response = await http.post(url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(berita));
  return "";
}
