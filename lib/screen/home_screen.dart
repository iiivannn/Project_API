// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:app_api/languages/languages.dart';
import 'package:app_api/translation/translation_api.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:kana_kit/kana_kit.dart';

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
                  Icon(Icons.swap_vert_rounded,
                      size: 50, color: Color.fromARGB(255, 28, 31, 63)),
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
                            color: Colors.white54),
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

class KanaKitScreen extends StatelessWidget {
  const KanaKitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dito yung KanaKit', style: TextStyle(fontSize: 20)),
    );
  }
}

class KitKana extends StatefulWidget {
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
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'kanaKIT',
              style: TextStyle(
                fontFamily: 'OverlockSC',
                color: Colors.deepOrange,
                fontSize: 45,
              ),
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: 'Enter text'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = kanaKit.toRomaji(_textController.text);
                    });
                  },
                  child: const Text(
                    'Convert to Romaji',
                    style: TextStyle(fontFamily: 'OverlockSC', fontSize: 15),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'OverlockSC',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          //Center(
          //child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //children: [
          //Text(
          //'Romaji: ${kanaKit.toRomaji('こんにちは')}',
          //style:
          //const TextStyle(fontSize: 35, fontFamily: 'OverlockSC'),
          //),
          //],
          //),
          //),
        ),
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
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
