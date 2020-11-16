import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'amap_all_fluttify/demo/demo.screen.dart';

//Future<void> main() async {
//  runApp(MyApp());
//
//  await enableFluttifyLog(false);
//  await AmapService.init(
//    iosKey: 'c3b60c1f305f5b18aab83056c6971709',
//    androidKey: 'b515edaa8a1230aa4d2aa9447a7f66d7',
//  );
//}

class AmapAllFluttifyApp extends StatefulWidget {
  @override
  _AmapAllFluttifyAppState createState() => _AmapAllFluttifyAppState();
}

class _AmapAllFluttifyAppState extends State<AmapAllFluttifyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('AMaps examples')),
          backgroundColor: Colors.grey.shade200,
          body: MapDemo(),
        ),
      ),
    );
  }
}
