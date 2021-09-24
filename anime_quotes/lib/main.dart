import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Citacoes Animes",
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[400]),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            title: const Text(
              "Citações de Animes",
            ),
          ),
          body: QuoteWidget()),
    );
  }
}

class QuoteState extends State<QuoteWidget> {
  var _quote = {};

  @override
  void initState() {
    super.initState();

    _loadQuote();
  }

  _loadQuote() async {
    String url = "https://animechan.vercel.app/api/random";
    http.Response response = await http.get(Uri.parse(url));
    //Passar os dados para a UI thread
    setState(() {
      _quote = jsonDecode(response.body);
    });
  }

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Anime: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_quote['anime'].toString())
            ],
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Character: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_quote['character'].toString())
            ],
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            "Citação: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            _quote["quote"].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Padding(padding: EdgeInsets.only(bottom: 180.0)),
          Container(
            width: 130,
            height: 50,
            child: ElevatedButton(
              onPressed: _loadQuote,
              child: const Text("Nova Citação"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple)),
            ),
          )
        ]);
  }
}

class QuoteWidget extends StatefulWidget {
  @override
  createState() => QuoteState();
}
