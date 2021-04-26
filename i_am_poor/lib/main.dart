import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[800],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('i am poor'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/carbon.png'),
          ),
        ),
      ),
    ),
  );
}
