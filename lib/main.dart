import 'package:countany/countanyHome.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    new Center(
      child: new MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Count Any",
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      home: new CountAny(),
    );
  }
}