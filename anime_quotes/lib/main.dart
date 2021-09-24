import 'package:anime_quotes/anime_widget.dart';
import 'package:anime_quotes/char_widget.dart';
import 'package:anime_quotes/quote_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Citacoes Animes",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
          title: const Text(
            "Citações de Animes",
          ),
        ),
        body: Column(
          children: [
            AnimeWidget(),
            const Padding(padding: EdgeInsets.all(10.0)),
            CharWidget(),
            const Padding(padding: EdgeInsets.all(10.0)),
            QuoteWidget()
          ],
        ),
      ),
    );
  }
}
