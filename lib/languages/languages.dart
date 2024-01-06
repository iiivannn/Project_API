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
      children: List.generate(
        2,
        (index) => DropdownButton<String>(
          value: selectedLanguages[index],
          onChanged: (newValue) {
            setState(() {
              selectedLanguages[index] = newValue!;
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
      ),
    );
  }
}
