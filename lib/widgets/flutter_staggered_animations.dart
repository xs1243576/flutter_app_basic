import 'package:flutter/material.dart';

import 'flutter_staggered_animations/screens/card_column_screen.dart';
import 'flutter_staggered_animations/screens/card_grid_screen.dart';
import 'flutter_staggered_animations/screens/card_list_screen.dart';

//void main() => runApp(App());

//Easily add staggered animations to your ListView, GridView, Column and Row children as shown in Material Design guidelines

class FlutterStaggeredAnimationspp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromRGBO(239, 238, 239, 1.0),
      ),
      home: const FlutterStaggeredAnimationsScreen(),
    );
  }
}

class FlutterStaggeredAnimationsScreen extends StatelessWidget {
  const FlutterStaggeredAnimationsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text('List Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardListScreen()),
                );
              },
            ),
            RaisedButton(
              child: const Text('Grid Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardGridScreen()),
                );
              },
            ),
            RaisedButton(
              child: const Text('Column Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardColumnScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
