import 'package:flutter/material.dart';

import 'flutter_staggered_grid_view/routes.dart';

//void main() => runApp(new MyApp());

class FlutterStaggeredGridViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'StaggeredGridView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
