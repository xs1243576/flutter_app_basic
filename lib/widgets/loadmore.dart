import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

//void main() => runApp(new MyApp());

class LoadMoreApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new LoadMorePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoadMorePage extends StatefulWidget {
  LoadMorePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoadMorePageState createState() => new _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  int get count => list.length;

  List<int> list = [];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(15, (v) => v));
      print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: count >= 60,
            onLoadMore: _loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(list[index].toString()),
                  height: 40.0,
                  alignment: Alignment.center,
                );
              },
              itemCount: count,
            ),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.chinese,
          ),
          onRefresh: _refresh,
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }
}

