import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void getLanguages() async {
  final response = await http.get(
    Uri.parse('https://text-translator2.p.rapidapi.com/getLanguages'),
    headers: {
      'X-RapidAPI-Key': '2725c6c0f3mshe379831fb313dbap1e4734jsnf84290b2df20',
      'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com',
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw ErrorDescription('Failed to load languages');
  }
}

// void main() {
//   getLanguages();
// }
