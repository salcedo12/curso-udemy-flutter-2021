import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('I am Rich hola'),
        ),
        body: Center(
          child: Image(image: AssetImage('images/esmeralda.png')),
        ),
      ),
    ),
  );
}
