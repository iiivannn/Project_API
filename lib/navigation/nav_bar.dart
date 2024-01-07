// ignore_for_file: library_private_types_in_public_api

import 'package:app_api/screen/kana.dart';
import 'package:app_api/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:app_api/screen/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('image/Wallpaper_4.jpg'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.red, size: 35),
            centerTitle: false, // CenterTitle set to false
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 28, 31, 63),
              ),
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swap_horizontal_circle),
                SizedBox(width: 8), // Adjust the spacing as needed
                Text(
                  'TranslateEASE',
                  style: TextStyle(
                    fontFamily: 'Gruppo',
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const <Widget>[
              HomePage(),
              KitKana(),
              SettingScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 28, 31, 63),
            currentIndex: _currentIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
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
                icon: Icon(Icons.fact_check_rounded),
                label: 'Info',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
