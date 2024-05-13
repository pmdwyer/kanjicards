import 'package:flutter/material.dart';
import 'package:kanjicards/widget/home_page.dart';

void main() {
  runApp(const KanjiCardApp());
}

class KanjiCardApp extends StatelessWidget {
  const KanjiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanji Cards',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Kanji Card Home Page'),
    );
  }
}
