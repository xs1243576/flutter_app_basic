import 'package:flutter/material.dart';

///
/// des:
///

class Test11Page extends StatefulWidget {
  Test11Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test11PageState createState() => _Test11PageState();
}

class _Test11PageState extends State<Test11Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListTile Example"),
      ),
      body: new ListView(
        children: new List.generate(7, (int index) {
          if (index == 6) {
            return new ListTile(
              isThreeLine: true,
              leading: Icon(Icons.event_note),
              title: Text('Title 1'),
              // subtitle: Text('Title2'),
              subtitle: Column(
                children: <Widget>[
                  Text('Titile2'),
                  Text('Title 3'),
                  Text('Title 4'),
                  Text('and so on')
                ],
              ),
            );
          }

          if (index == 5) {
            return new Container(
                decoration: new BoxDecoration(color: Colors.red),
                child: new ListTile(
                    leading: const Icon(Icons.euro_symbol),
                    title: Text('250,00')));
          }

          if (index == 4) {
            return new cardy();
          }

          if (index == 3) {
            return Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () => print("点我"), // 处理点击事件
                child: Container(height: 200, width: 200),
              ),
            );
          }

          if (index % 2 == 0) {
            return new ListTile(
              title: new Center(
                  child: new Text(
                "Centered Title#$index",
                style:
                    new TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              )),
              subtitle: new Text("My title is centered"),
            );
          } else {
            return new ListTile(
              title: new Row(
                children: <Widget>[
                  new Text(
                    "Centered Title#$index",
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 25.0),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              subtitle: new Text("My title is centered"),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class cardy extends StatefulWidget {
  @override
  _cardyState createState() => new _cardyState();
}

class _cardyState extends State<cardy> {
  var isSelected = false;
  var mycolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: mycolor, //控制背景色
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: isSelected,
            //控制选中
            leading: const Icon(Icons.info),
            title: new Text("Test"),
            subtitle: new Text("Test Desc"),
            trailing: new Text("3"),
            onLongPress: toggleSelection //长按选中/取消
            )
      ]),
    );
  }

  void toggleSelection() {
    setState(() {
      if (isSelected) {
        mycolor = Colors.white;
        isSelected = false;
      } else {
        mycolor = Colors.grey[300];
        isSelected = true;
      }
    });
  }
}
