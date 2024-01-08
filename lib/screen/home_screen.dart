// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:app_api/languages/languages.dart';
import 'package:app_api/translation/translation_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String txt = '';
  String? translatedText;
  List<String> selectedLanguages = [
    'English',
    'Tagalog'
  ]; // Dropdown default languages

  void translateText() async {
    final transText =
        await translate(txt, selectedLanguages[0], selectedLanguages[1]);
    setState(() {
      translatedText = transText;
    });
  }

  void copyTranslatedText() {
    if (translatedText != null) {
      Clipboard.setData(ClipboardData(text: translatedText!));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Translated text copied to clipboard'),
        ),
      );
    }
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
              ),
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    txt = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter Text to Translate',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 108, 155, 181),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelStyle:
                      const TextStyle(fontFamily: 'Alata', fontSize: 20.0),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ), // Set the desired padding
                ),
                style: const TextStyle(fontFamily: 'Alata', fontSize: 20.0),
                maxLines: 3,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey[100],
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.swap_vert_rounded,
                            size: 30, color: Colors.black),
                        onPressed: () {
                          translateText();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 145, 116, 116),
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(23.0),
                      child: const Text(
                        '...',
                        style: TextStyle(
                          fontFamily: 'Alata',
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: copyTranslatedText,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 145, 116, 116),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Copy Text',
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: translateText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 4.0,
                ),
                child: const Text(
                  'Translate',
                  style: TextStyle(
                      fontSize: 13, color: Colors.white, fontFamily: 'Bungee'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
