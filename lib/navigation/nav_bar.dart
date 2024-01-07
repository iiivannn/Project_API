// ignore_for_file: library_private_types_in_public_api

import 'package:app_api/screen/home_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const KanaKitScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/Wallpaper_4.jpg'),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.red, size: 35),
            leading: const Icon(Icons.swap_horizontal_circle),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
              color: Color.fromARGB(255, 28, 31, 63),
            )),
            title: const Text(
              'TranslateEASE',
              style: TextStyle(
                  fontFamily: 'Gruppo',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 28, 31, 63),
            currentIndex: _currentIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'KanaKit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
