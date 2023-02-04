import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Location.dart';

class Networking {
  String url;
  Networking(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;
    return jsonDecode(data);
  }
}
