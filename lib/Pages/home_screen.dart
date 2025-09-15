import 'package:flutter/material.dart';

import 'models/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  network n = network();
}
  Future<void> _searchBooks(String query) async {
    try{
      List<Book> books= await n.searchBooks(query);
      print("Books:${books.toString()}");
    }catch(e){

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(child: Text("Home screen")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
