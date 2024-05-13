import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'kanji_canvas.dart';
import '../model/writing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: const KanjiCanvas()
    );
  }
}
