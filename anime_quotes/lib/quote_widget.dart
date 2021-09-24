import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    return Column(children: <Widget>[
      Padding(padding: EdgeInsets.all(10.0)),
      Text("Citação: "),
      Padding(padding: EdgeInsets.all(10.0)),
      Text(_quote["quote"].toString())
    ]);
  }
}

class QuoteWidget extends StatefulWidget {
  @override
  createState() => QuoteState();
}
