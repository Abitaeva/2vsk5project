import 'package:flutter/material.dart';
import 'package:project5naz/homepage.dart';
import 'package:project5naz/likepage.dart';
import 'package:project5naz/listpage.dart';
import 'package:project5naz/profilepage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
  HomePage(),
  LikePage(),
  ProfilePage(
    firstName: 'Nazyken',
    lastName: 'Abitayeva',
    phoneNumber: '87478424543',
  ),
  ListPage(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.pink),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.pink),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
