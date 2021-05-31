import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff20324a),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Image.asset('images/LogoInicio.png'),
                    height: 50.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Eduardo Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 200.0,
                ),
                MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  color: Colors.white,
                  child: Text(
                    'Begin',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
