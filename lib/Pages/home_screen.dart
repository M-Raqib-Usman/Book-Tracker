import 'package:flutter/material.dart';

import '../Network/network.dart';
import 'models/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  network n = network();
  List<Book> _books = [];

  Future<void> _searchBooks(String query) async {
    try {
      List<Book> books = await n.searchBooks(query);
      setState(() {
        _books = books;
      });
      //print("Books:${books.toString()}");
    } catch (e) {
      print("Did not get anything");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search For Book',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            onSubmitted: (query) =>_searchBooks(query),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
              itemCount: _books.length,
                itemBuilder: (context,index){
                  Book book=_books[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.authors.join(', &')),
              );
            }),
          ),
        )
      ])),
    );
  }
}
