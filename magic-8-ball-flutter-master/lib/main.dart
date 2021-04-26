import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            title: Text('Magic 8 poll'),
            backgroundColor: Colors.black,
          ),
          body: MagicBall(),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int number = 2;

  void imageRandom() {
    setState(() {
      number = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                imageRandom();
              },
              child: Image(
                image: AssetImage('images/ball$number.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
