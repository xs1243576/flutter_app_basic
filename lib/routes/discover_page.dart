import 'package:flutter/material.dart';

///
/// des:
///

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

// 缓存tabbar pageview对应的页面
// with AutomaticKeepAliveClientMixin

class _DiscoverPageState extends State<DiscoverPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
//          new ExactAssetImage('images/star.jpg'),
//          Image.asset('images/star.jpg',width: 200,height: 200,),
              new AssetImage(
            'images/star.jpg',
          ),
//          NetworkImage(
//            'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
//          new Image.network('https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg',width: 200,height: 200,),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: Text('首页'),
        ),
//        drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
          child: new Center(
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
