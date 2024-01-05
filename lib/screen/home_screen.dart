import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TranslateEase API'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Text to Translate',
                  border: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 22.0),
                ),
                style: TextStyle(fontSize: 20.0),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 1.0,
                color: Colors.grey,
              ),
              const SizedBox(height: 16.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Translated Text',
                  border: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 22.0),
                ),
                style: TextStyle(fontSize: 20.0),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add translation logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 125, 147, 138),
                  elevation: 4.0, // Increase the elevation for a larger button
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
