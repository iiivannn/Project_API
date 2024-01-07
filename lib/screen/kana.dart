// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kana_kit/kana_kit.dart';

class KitKana extends StatefulWidget {
  const KitKana({Key? key}) : super(key: key);

  @override
  _KitKanaState createState() => _KitKanaState();
}

class _KitKanaState extends State<KitKana> {
  final KanaKit kanaKit = const KanaKit();
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/Wallpaper_5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white10,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'kanakit',
                        style: TextStyle(
                          fontFamily: 'OverlockSC',
                          color: Colors.deepOrange,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blueGrey[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                labelText: 'Enter Japanese Text',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 108, 155, 181),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelStyle: const TextStyle(
                                  fontFamily: 'Alata',
                                  fontSize: 20.0,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 20.0,
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Alata',
                                fontSize: 20.0,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _result =
                                      kanaKit.toRomaji(_textController.text);
                                });
                              },
                              child: const Text(
                                'Convert to Romaji',
                                style: TextStyle(
                                    fontFamily: 'OverlockSC',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              _result,
                              style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'OverlockSC',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
