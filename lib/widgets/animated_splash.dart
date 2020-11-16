import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

//void main() {
//  runApp(MaterialApp(
//    home: AnimatedSplash(
//      imagePath: 'assets/flutter_icon.png',
//      home: Home(),
//      customFunction: duringSplash,
//      duration: 2500,
//      type: AnimatedSplashType.BackgroundProcess,
//      outputAndHome: op,
//    ),
//  ));
//}

class AnimatedSplashApp extends StatelessWidget {

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: AnimatedSplashPage(), 2: HomeSt()};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Glow Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplash(
        imagePath: 'images/avatar.png',
        home: AnimatedSplashPage(),
        customFunction: duringSplash,
        duration: 2500,
        type: AnimatedSplashType.BackgroundProcess,
        outputAndHome: op,
      ),
    );
  }
}

class AnimatedSplashPage extends StatefulWidget {
  @override
  _AnimatedSplashState createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Text('My Cool App',
                style: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}

class HomeSt extends StatefulWidget {
  @override
  _HomeStState createState() => _HomeStState();
}

class _HomeStState extends State<HomeSt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Text('My Cool App home page 2',
                style: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}

