import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeState extends State<AnimeWidget> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Anime: "),
        Padding(padding: EdgeInsets.all(10.0)),
        Text(_quote['anime'].toString())
      ],
    );
  }
}

class AnimeWidget extends StatefulWidget {
  @override
  createState() => AnimeState();
}
