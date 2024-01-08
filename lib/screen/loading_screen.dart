// ignore_for_file: library_private_types_in_public_api

import 'package:app_api/navigation/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3500), () {
      navigateToHomePage();
    });
  }

  // Navigates to NavBar
  void navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}


//const Color.fromARGB(255, 125, 147, 138),