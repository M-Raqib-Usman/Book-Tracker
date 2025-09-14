import 'package:http/http.dart' as http;
import '../Pages/models/book.dart';
import 'dart:convert';

class network {
  //api endpoint
  static const String _baseurl = "https://www.googleapis.com/books/v1/volumes";

  Future<List<Book>> searchBooks(String query) async {
    var url = Uri.parse('$_baseurl?q=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //we have json(data)
      var data = json.decode(response.body);
      if(data['totalItems']!=null && data['items'] is List){
List<Book> books=(data['items']as List<dynamic>)
    .map((book)=>Book.fromJson(book as Map<String,dynamic>))
    .toList();
return books;
      }else{
        return [];
      }
    } else {
      throw Exception('Failed to Load Books');
    }
  }
}
