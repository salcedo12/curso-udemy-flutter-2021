import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: FlatButton(
                onPressed: () {
                  // or as a local variable
                  final player = AudioCache();
                  player.play('assets/BADBUNNY.mp3');
                },
                child: Text('Click Me')),
          ),
        ),
      ),
    );
  }
}
