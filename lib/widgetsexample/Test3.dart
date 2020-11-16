// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() {
//  runApp(new MyApp());
//}

class Anchor {
  String nickname;
  String roomName;
  String imageUrl;

  Anchor({this.nickname, this.roomName, this.imageUrl});

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    this.nickname = parsedMap["nickname"];
    this.roomName = parsedMap["roomName"];
    this.imageUrl = parsedMap["roomSrc"];
  }
}

class Test3 extends StatefulWidget {
  Test3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test3PageState createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3> {
  var strjson = 'kk';

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    this.getAnchors();
  }

  Future<List<Anchor>> getAnchors() async {
    // 1.读取json文件
    String jsonString = await rootBundle.loadString("assets/yz.json");

    print(jsonString);

    // 2.转成List或Map类型
    final jsonResult = json.decode(jsonString);

    print(jsonResult);

    // 3.遍历List，并且转成Anchor对象放到另一个List中
    List<Anchor> anchors = new List();
    for (Map<String, dynamic> map in jsonResult) {
      print(map);
      print(Anchor.withMap(map).toString());
      anchors.add(Anchor.withMap(map));
    }

    print(anchors);

    setState(() {
      strjson = anchors.toList().toString(); // json处理解析正确，没有重写tostring方法
    });

    return anchors;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Text(strjson,
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: 40.0, color: Colors.black87)),
      ),
    );
  }
}

//decoration: TextDecoration.none)),
