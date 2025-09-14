import 'package:book_tracker/Pages/favourite_screen.dart';
import 'package:book_tracker/Pages/home_screen.dart';
import 'package:book_tracker/Pages/models/book.dart';
import 'package:book_tracker/Pages/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_tracker/Network/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentindex = 0;

  network n = network();

  Future<void> _searchBooks(String query) async {
    try{
      List<Book> books= await n.searchBooks(query);
      print("Books:${books.toString()}");
    }catch(e){

    }

  }
  final List<Widget> _screens = [
    HomeScreen(),
    SavedScreen(),
    FavouriteScreen(),
  ];
  void initState(){
    _searchBooks('Android');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reader'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
      ),
    );
  }
}
