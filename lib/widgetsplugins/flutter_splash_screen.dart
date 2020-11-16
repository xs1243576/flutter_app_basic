import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

//void main() => runApp(FlutterSplashScreenApp());

class FlutterSplashScreenApp extends StatefulWidget {
  @override
  _FlutterSplashScreenAppState createState() => _FlutterSplashScreenAppState();
}

class _FlutterSplashScreenAppState extends State<FlutterSplashScreenApp> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 3600), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_splash_screen'),
        ),
        body: Center(
          child: Text(
            'by CrazyCodeBoy',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
