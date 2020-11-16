import 'package:flutter/material.dart';
import 'package:paging/paging.dart';

//void main() => runApp(MyApp());

class PagingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PagingPage(title: 'Paging Example'),
    );
  }
}

class PagingPage extends StatefulWidget {
  PagingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PagingPageState createState() => _PagingPageState();
}

class _PagingPageState extends State<PagingPage> {
  static const int _COUNT = 10;

  // mocking a network call
  Future<List<String>> pageData(int previousCount) async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    List<String> dummyList = List();
    if (previousCount < 30) {
      // stop loading after 30 items
      for (int i = previousCount; i < previousCount + _COUNT; i++) {
        dummyList.add('Item $i');
      }
    }
    return dummyList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Pagination(
        pageBuilder: (currentListSize) => pageData(currentListSize),
//        itemBuilder: (item) => ListTile(title: Text(item)), // 报错
        itemBuilder: (index, item) => ListTile(title: Text(item)),
      ),
//      body: Pagination<String>(
//        pageBuilder: (currentSize) => pageData(currentSize),
//        itemBuilder: (index, item) {
//          return Container(
//            color: Colors.yellow,
//            height: 48,
//            child: Text(item),
//          );
//        },
//      ),
    );
  }
}
