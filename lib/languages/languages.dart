// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LanguageDropdownRow extends StatefulWidget {
  final Function(List<String>) onLanguagesSelected;

  const LanguageDropdownRow({Key? key, required this.onLanguagesSelected})
      : super(key: key);

  @override
  _LanguageDropdownRowState createState() => _LanguageDropdownRowState();
}

class _LanguageDropdownRowState extends State<LanguageDropdownRow> {
  List<String> selectedLanguages = [
    'English',
    'Tagalog'
  ]; // Initialize with default values

  Map<String, String> languageMap = {
    'English': 'en',
    'Chinese': 'zh',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Indonesian': 'id',
    'Thai': 'th',
    'Tagalog': 'tl',
    'Vietnamese': 'vi',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueGrey[200],
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'From',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
              DropdownButton<String>(
                value: selectedLanguages[0],
                onChanged: (newValue) {
                  setState(() {
                    selectedLanguages[0] = newValue!;
                    // Call the callback with selected languages
                    widget.onLanguagesSelected(selectedLanguages
                        .map((lang) => languageMap[lang] ?? "tl")
                        .toList());
                  });
                },
                items: languageMap.keys.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueGrey[200],
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'To',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
              DropdownButton<String>(
                value: selectedLanguages[1],
                onChanged: (newValue) {
                  setState(() {
                    selectedLanguages[1] = newValue!;
                    // Call the callback with selected languages
                    widget.onLanguagesSelected(selectedLanguages
                        .map((lang) => languageMap[lang] ?? "tl")
                        .toList());
                  });
                },
                items: languageMap.keys.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
