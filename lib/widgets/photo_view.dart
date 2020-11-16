import 'package:flutter/material.dart';
import 'photo_view/screens/home_screen.dart';

///
/// des:
///

class photo_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//void main() => runApp(MyApp());

ThemeData theme = ThemeData(
  primaryColor: Colors.black,
  backgroundColor: Colors.white10,
  fontFamily: 'PTSans',
);

class PhotoViewApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo View Example App',
      theme: theme,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
