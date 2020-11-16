import 'package:flutter/material.dart';
import '../routers_one.dart';

///
/// des:
///

class MessagePage extends StatefulWidget {
  MessagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MessagePageState createState() => _MessagePageState();
}

// 缓存tabbar pageview对应的页面
// with AutomaticKeepAliveClientMixin

class _MessagePageState extends State<MessagePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var routeLists = routersOne.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
//      appBar: PreferredSize(
//          child: Container(
//            width: double.infinity,
//            height: double.infinity,
//            decoration: BoxDecoration(
//                gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
//            child: SafeArea(child: Text("1212")),
//          ),
//          preferredSize: Size(double.infinity, 60)),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routersOne.keys.toList()[index]),
                ),
              ),
            );
          },
          itemCount: routersOne.length,
        ),
      ),
      // This traili
      // There are multiple heroes that share the same tag within a subtree.
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        heroTag: 'messagepage',
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// There are multiple heroes that share the same tag within a subtree.
// floatingActionButton 导致的
// 在子树中有多个Hero 对象共用了一个tag，每个Hero对象的tag必须是惟一的。
// heroTag: 'messagepage',
