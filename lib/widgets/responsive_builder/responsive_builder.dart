import 'views/home/home_view.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

//A set of widgets that can be used to define a readable responsive UI for widgets.
//一组小部件，可用于为小部件定义可读的响应性UI。

class ResponsiveBuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}
