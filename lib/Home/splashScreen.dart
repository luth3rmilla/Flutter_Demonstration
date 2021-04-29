import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/homePage', (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/screen.JPG'),
    );
  }
}
