import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> translate(String text, String srcLang, String targetLang) async {
  final res = await http.post(
    Uri.parse('https://text-translator2.p.rapidapi.com/translate'),
    headers: {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '2725c6c0f3mshe379831fb313dbap1e4734jsnf84290b2df20',
      'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com',
    },
    body: "source_language=$srcLang&target_language=$targetLang&text=$text",
  );

  if (res.statusCode == 200) {
    return jsonDecode(res.body)["data"]["translatedText"];
  } else {
    throw ErrorDescription(
        "Unable to translate: Status code ${res.statusCode}");
  }
}
