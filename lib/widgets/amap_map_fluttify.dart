import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'amap_map_fluttify/map/map.screen.dart';

//Future<void> main() async {
//  runApp(MyApp());
//
//  await enableFluttifyLog(false);
//  await AmapService.init(
//    iosKey: '2dd410e014ecd20e5d3cbf18363db96b',
//    androidKey: '52c1ce14bf08697a2ef790376e2316f7',
//    webApiKey: '2917e3e681fa9ef6c06d1934e114a6ca',
//  );
//}

class AmapMapFluttifyApp extends StatefulWidget {
  @override
  _AmapMapFluttifyAppState createState() => _AmapMapFluttifyAppState();
}

class _AmapMapFluttifyAppState extends State<AmapMapFluttifyApp> {
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

