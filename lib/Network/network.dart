import 'package:http/http.dart' as http;
import '../Pages/models/book.dart';
import 'dart:convert';

class network {
  //api endpoint
  static const String _baseurl = "https://www.googleapis.com/books/v1/volumes";

  Future<void> searchBooks(String query) async {
    var url = Uri.parse('$_baseurl?q=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //we have json(data)
      var data = json.decode(response.body);
      print(data);
    } else {}
  }
}
