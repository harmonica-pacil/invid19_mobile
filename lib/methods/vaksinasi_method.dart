import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vaksin.dart';
import '../models/pendaftar.dart';

Future<dynamic> addVaksin(Vaksin vaksin) async {
  var url =
      Uri.parse('https://invid19.herokuapp.com/vaksinasi/add-vaksin-flutter');
  var response = await http.post(url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(vaksin));
  return jsonDecode(response.body)["success"];
}

Future<dynamic> addPendaftar(Pendaftar pendaftar) async {
  var url =
      Uri.parse('https://invid19.herokuapp.com/vaksinasi/add-pendaftar-flutter');
  var response = await http.post(url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(pendaftar));
  return jsonDecode(response.body)["success"];
}

Future<List<Vaksin>> getArtikel() async {
  var url =
      Uri.parse('https://invid19.herokuapp.com/vaksinasi/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Vaksin> vaksin = [];
  for (var d in data) {
    if (d != null) {
      vaksin.add(Vaksin.fromJson(d));
    }
  }

  return vaksin;
}