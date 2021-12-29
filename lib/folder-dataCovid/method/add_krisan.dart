import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> addNewKrisan(String krisan) async {
  var url = Uri.parse('https://invid19.herokuapp.com/data-covid/flutter');
  var response = await http.post(url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode({"text_krisan": krisan}));
  print(jsonEncode({"text_krisan": krisan}));
  print(response.body);
  return jsonDecode(response.body)["success"];
}
