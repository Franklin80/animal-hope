import 'package:flutter/material.dart';

import './widgets/animal_list.dart';

import './model/DUMMY_DATA.dart';
import './model/animal.dart';

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

  static final List<Widget> _widgetOptions = [
    const Text(
      'The Shelter',
      style: optionStyle,
    ),
    AnimalList(),
    const Text(
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

  List<Animal> getAnimalList() {
    return DUMMY_DATA().loadAnimals();
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
