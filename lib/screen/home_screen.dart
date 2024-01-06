// ignore_for_file: library_private_types_in_public_api

import 'package:app_api/languages/languages.dart';
import 'package:app_api/translation/translation_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String txt = '';
  String? translatedText;
  List<String> selectedLanguages = ['English', 'Tagalog']; // Default values

  void translateText() async {
    final transText =
        await translate(txt, selectedLanguages[0], selectedLanguages[1]);
    setState(() {
      translatedText = transText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageDropdownRow(
                onLanguagesSelected: (languages) {
                  setState(() {
                    selectedLanguages = languages;
                  });
                },
              ), // Add the LanguageDropdownRow widget here
              const SizedBox(height: 20.0), // Add some spacing
              TextField(
                onChanged: (value) {
                  setState(() {
                    txt = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Text to Translate',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 108, 155, 181),
                      width: 2.0,
                    ),
                  ),
                  labelStyle: TextStyle(fontFamily: 'Alata', fontSize: 20.0),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ), // Set the desired padding
                ),
                style: const TextStyle(fontFamily: 'Alata', fontSize: 20.0),
                maxLines: 3,
              ),
              const SizedBox(height: 30.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_upward, size: 30),
                  Icon(Icons.arrow_downward, size: 30),
                ],
              ),
              const SizedBox(height: 30.0),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 70, 90, 99),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(23.0),
                      child: const Text(
                        'Translated Text',
                        style: TextStyle(
                          fontFamily: 'Dosis',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                      child: Text(
                        translatedText ??
                            'Your translated text will appear here.',
                        style: const TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 18.0,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: translateText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 125, 147, 138),
                  elevation: 4.0,
                ),
                child: const Text(
                  'Translate',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Screen or baka Dictionary whateva',
          style: TextStyle(fontSize: 20)),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Account Screen and/or Premium Promotion lol',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
