import 'package:flutter/material.dart';

///
/// des:
///

class Test4 extends StatefulWidget {
  Test4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test4PageState createState() => _Test4PageState();
}

class _Test4PageState extends State<Test4> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(
                Icons.star,
                color: Colors.black,
                size: 12,
              ),
              new Icon(Icons.star, color: Colors.black, size: 12),
              new Icon(Icons.star, color: Colors.black, size: 12),
              new Icon(Icons.star, color: Colors.black, size: 12),
//              new Icon(Icons.star, color: Colors.black, size: 12),
              new Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 12.0,
//                textDirection: TextDirection.ltr,
//                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 10.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    // 所有的子节点继承
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Icon(
                  Icons.kitchen,
                  color: Colors.green[500],
                  size: 15,
                ),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: [
                new Icon(
                  Icons.timer,
                  color: Colors.green[500],
                  size: 15,
                ),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: [
                new Icon(
                  Icons.restaurant,
                  color: Colors.green[500],
                  size: 15,
                ),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    Widget titleText = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Text(
        '''
        first title
        ''',
//        textDirection: TextDirection.ltr,
        softWrap: true,
        style: new TextStyle(fontSize: 10.0, color: Colors.black87),
      ),
    );

    Widget subTitle = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.
        ''',
        softWrap: true,
        style: new TextStyle(fontSize: 10.0),
      ),
    );

    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    var mainImage = new Expanded(
      child: new Image.asset('images/avatar.png', width: 200, height: 200),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('空视图'),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 350.0,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  width: 210.0,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
