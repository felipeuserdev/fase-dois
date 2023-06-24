import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getInfo() async {
  var url =
      Uri.parse("https://fase-dois-default-rtdb.firebaseio.com/categoria.json");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return json;
  } else {
    throw Exception(response.statusCode);
  }
}
