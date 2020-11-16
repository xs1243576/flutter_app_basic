import 'package:flutter/material.dart';
import 'dart:convert' show json;

///
/// des:
///

//  iconfont  阿里字体图标的使用

class Test10Page extends StatefulWidget {
  Test10Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test10PageState createState() => _Test10PageState();
}

class _Test10PageState extends State<Test10Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('空视图'),
      ),
      body: new FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/person.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = json.decode(snapshot.data.toString());

            return new ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text("Name: ${data[index]["name"]}"),
                      new Text("Age: ${data[index]["age"]}"),
                      new Text("Height: ${data[index]["height"]}"),
                      new Text("Gender: ${data[index]["gender"]}"),
                      new Text(
                        "\u{e7d7}",
                        style: new TextStyle(
                          fontFamily: "Iconfont",
                          fontSize: 36.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return new CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
