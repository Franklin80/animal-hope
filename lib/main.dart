import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Hope',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'The Animal Shelter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _currentPageTitle = "The Shelter";

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = [
    Text(
      'The Shelter',
      style: optionStyle,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/cats/cat_1_small.jpg', fit: BoxFit.cover),
        Text(
          'Our Pets',
          textAlign: TextAlign.center,
          style: optionStyle,
        ),
      ],
    ),
    Text(
      'Emergency Pets',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _currentPageTitle = "The Shelter";
      } else if (_selectedIndex == 1) {
        _currentPageTitle = "Our Pets";
      } else if (_selectedIndex == 2) {
        _currentPageTitle = "Emergencies";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageTitle),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.healing), label: 'Emergencies'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedItemColor: Colors.amber[800],
        selectedLabelStyle: TextStyle(color: Colors.amber[800]),
        onTap: _onItemTapped,
      ),
    );
  }
}
