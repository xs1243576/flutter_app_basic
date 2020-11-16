import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

///
/// des:
///

class Test1 extends StatefulWidget {
  Test1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 隐藏底部按钮栏
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
// 隐藏状态栏
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
// 隐藏状态栏和底部按钮栏
//    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue, statusBarBrightness: Brightness.light));

//    1. 单方向若需要固定应用为单一方向，仅需设置所需要的方向属性即可；
// 竖直上
//    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// 竖直下
//    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
// 水平左
//    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
// 水平右
//    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

//    2. 多方向若需要应用随重力感应变化方向，需设置多个方向属性；
// 竖直方向
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
// 水平方向
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft]);
// 多方向
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.portraitUp
//    ]);

//    默认隐藏底部虚拟状态栏(需手机支持虚拟状态栏设备)，即三大金刚键；获取焦点后展示状态栏，展示大小为去掉状态栏时整体大小；
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

//    默认隐藏顶部虚拟状态栏，获取焦点后展示状态栏，展示大小为去掉状态栏时整体大小；
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

//    即默认情况，顶部底部状态栏均展示；
//    SystemChrome.setEnabledSystemUIOverlays(
//        [SystemUiOverlay.top, SystemUiOverlay.bottom]);

//    该属性仅用于 Android 设备且 SDK >= O 时，底部状态栏颜色；
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.pink));
//    该属性仅用于 Android 设备且 SDK >= P 时，底部状态栏与主内容分割线颜色，效果不是很明显；
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarDividerColor: Colors.yellow));
//    该属性仅用于 Android 设备且 SDK >= O 时，底部状态栏图标样式，主要是三大按键颜色；
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.orange));
//    该属性仅用于 Android 设备且 SDK >= M 时，顶部状态栏颜色；
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));
//    该属性仅用于 Android 设备且 SDK >= M 时，顶部状态栏图标的亮度；但小菜感觉并不明显；
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
//    该属性仅用于 iOS 设备顶部状态栏亮度
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  }

  @override
  Widget build(BuildContext context) {
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    return MaterialApp(
      title: '空视图',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('空视图'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/avatar.png',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );

//    return Scaffold(
//      appBar: AppBar(
//        title: Text('空视图'),
//      ),
//      body: new ListView(
//        children: [
//          new Image.asset(
//            'images/lake.jpg',
//            width: 600.0,
//            height: 240.0,
//            fit: BoxFit.cover,
//          ),
//          titleSection,
//          buttonSection,
//          textSection,
//        ],
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}
