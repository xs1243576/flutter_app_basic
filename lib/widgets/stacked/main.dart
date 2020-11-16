import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/locator.dart';
import 'ui/bottom_nav/bottom_nav_example.dart';
import 'ui/multiple_streams_example/multiple_streams_example_view.dart';

//void main() {
//  configure();
//  runApp(MyApp());
//}

class StackedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavExample(),
    );
  }
}
