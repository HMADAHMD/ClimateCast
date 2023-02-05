import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String url;
  Networking(this.url);           //constructor to get api from loading Screen

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      String data = response.body;
      return jsonDecode(data);
    } catch (e) {
      print(e);
    }
  }
}
