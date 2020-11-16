import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/index.dart';
import 'routes/index.dart';

//void main() {
//  runApp(MyApp());
//  if (Platform.isAndroid) {
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  }
//}

//flukit(Flutter UI Kit), a flutter widgets library which contains ScaleView, Swiper, GradientCircularProgressIndicator...

class FlukitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flukit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlukitPage(title: 'Flukit demo'),
    );
  }
}

class FlukitPage extends StatefulWidget {
  FlukitPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlukitPageState createState() => _FlukitPageState();
}

class _FlukitPageState extends State<FlukitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListPage([
        //PageInfo("test", (ctx) => TestRoute()),
        PageInfo("Quick Scrollbar", (ctx) => QuickScrollbarRoute()),
        PageInfo("TurnBox", (ctx) => TurnBoxRoute()),
        PageInfo("AnimatedRotationBox", (ctx) => AnimatedRotationBoxRoute()),
        PageInfo("Pull Refresh", (ctx) => PullRefreshBoxRoute()),
        PageInfo("Swiper", (ctx) => SwiperRoute()),
        PageInfo("Swiper Style", (ctx) => SwiperStyleRoute()),
        PageInfo("Photo View", (ctx) => PhotoViewRoute()),
        PageInfo("InfiniteListView", (ctx) => InfiniteListViewRoute()),
        PageInfo("(Raised)GradientButton", (ctx) => GradientButtonRoute()),
        PageInfo("GradientCircularProgressIndicator",
            (ctx) => GradientCircularProgressRoute()),
        PageInfo("NineGridView & DragSortView", (ctx) => NineGridRoute()),
        PageInfo("AzListView", (ctx) => QuickSelectListViewRoute()),
      ]),
    );
  }
}
