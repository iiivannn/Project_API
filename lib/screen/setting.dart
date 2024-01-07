// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  List<String> imagePaths = [
    'image/Pacute.jpg',
    'image/Yasmin.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/Wallpaper_4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
              color: Colors.red,
            )),
            title: const Text(
              'Support the Developers by:',
              style: TextStyle(
                  fontFamily: 'Alata',
                  color: Color.fromARGB(255, 28, 31, 63),
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
          ),
          body: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return AccountScreen(imagePath: imagePaths[index]);
            },
            itemCount: 2,
            layout: SwiperLayout.STACK,
            itemWidth: MediaQuery.of(context).size.width * 0.8,
            itemHeight: MediaQuery.of(context).size.height * 0.7,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ),
        ),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  final String imagePath;
  const AccountScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 28, 31, 63),
                  radius: 120,
                  child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 115,
                      child: Image.asset(
                        imagePath,
                      )),
                ),
                const Text(
                  'BASIC',
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed!');
              },
              child: const Text('Press me'),
            ),
          ),
        ],
      ),
    );
  }
}
