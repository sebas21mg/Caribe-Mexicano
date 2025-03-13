import 'package:flutter/material.dart';
import 'package:myapp/map_view.dart';
import 'package:myapp/photo_book_page.dart';
import 'package:myapp/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caribe Mexicano',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:3949225609.
        navigationBarTheme: NavigationBarThemeData(
          shadowColor: Colors.cyan,
          indicatorColor: Colors.cyan.withAlpha(30),
          backgroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    MapView(),
    PhotoBookPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/logo.png', height: 30)],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore), label: ''),
          NavigationDestination(icon: Icon(Icons.book), label: ''),
          NavigationDestination(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
