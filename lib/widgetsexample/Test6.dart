// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'package:com.example.flutterappbasic/index.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

/// The height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56.0;

/// The height of the bottom navigation bar.
const double kBottomNavigationBarHeight = 56.0;

/// The height of a tab bar containing text.
const double kTextTabBarHeight = 48.0;

//void main() {
//  runApp(new MyApp());
//}

class Test6 extends StatefulWidget {
  Test6({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test6PageState createState() => _Test6PageState();
}

class _Test6PageState extends State<Test6> {
  TextEditingController _unameController; // = new TextEditingController();

  bool _nameAutoFocus = false;
  var _textFieldValue = '';

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _unameController = TextEditingController()
      ..addListener(() {
        //获取输入框的内容，变为大写
//        _unameController.text = _unameController.text.toUpperCase();
      });

    // 监听焦点变化
    _focusNode.addListener(() {
      print(_focusNode.hasFocus);
    });
  }

  void getFocus() {
//        动态获取焦点
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _unameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var topHeight = MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
//      appBar: AppBar(
//        title: Text('空视图'),
//      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.blue),
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.fromLTRB(0.0, topHeight, 0.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(color: Colors.white),
//        alignment: Alignment.topCenter,
              padding: new EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
              child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Icon(Icons.find_in_page, color: Colors.grey),
                    new Expanded(
                      flex: 1,
                      child: new Card(
                        child: TextFormField(
                            focusNode: _focusNode,
                            autofocus: _nameAutoFocus,
                            controller: _unameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            //search
                            textCapitalization: TextCapitalization.characters,
                            textAlignVertical: TextAlignVertical.center,
                            textDirection: TextDirection.ltr,
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                cut: true,
                                paste: true,
                                selectAll: true),
                            // 长按显示的工具

                            showCursor: true,
                            cursorWidth: 3,
                            cursorRadius: Radius.circular(10),
                            cursorColor: Colors.red,
//                          inputFormatters: [
//                            WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
//                            //只想让用户输入字符
//                          ],
//                          onEditingComplete: () {
//                            print('onEditingComplete');
//                          },
//                          onTap: () {
//                            print('onTap');
//                          },
                            //输入框右下角经常需要字数统计，除了使用上面介绍的方法外，还可以使用 buildCounter，建议使用此方法，
                            maxLength: 100,
                            buildCounter: (
                              BuildContext context, {
                              int currentLength,
                              int maxLength,
                              bool isFocused,
                            }) {
                              return Text(
                                '$currentLength/$maxLength',
                              );
                            },
                            onFieldSubmitted: (String value) async {
                              await showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Thanks!'),
                                    content: Text('You typed "$value".'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onChanged: (value) {
                              setState(() {
                                _textFieldValue = value;
                              });
                            },
//                  obscureText: true,  // 加密显示
                            decoration: InputDecoration(
//                    labelText: '请输入搜索内容',
//                    labelStyle: TextStyle(color: Colors.red),
//                    border: OutlineInputBorder(),
//                            hintText: '请输入搜索内容',
//                    hintStyle: TextStyle(color: Colors.grey),
//                    hintMaxLines: 1,
//                    prefixIcon: Icon(Icons.person),  // 图标居中
//                    icon: Icon(Icons.person),  // 图标偏左
//                      suffixIcon: Icon(Icons.person),
//                    helperText: '用户名长度为 6-10 个字母',
//                    helperStyle: TextStyle(color: Colors.blue),
//                    helperMaxLines: 1,
//                    errorText: '用户名输入错误',
//                    errorStyle: TextStyle(fontSize: 12),
//                    errorMaxLines: 1,
//                    errorBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.red)),
                              // 输入框右下角经常需要字数统计
//                            counterText: '${_textFieldValue.length}/32',
                              fillColor: Color(0x30cccccc),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x00FF0000)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              hintText: 'QQ 号/手机号/邮箱',
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x00000000)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              // 底部绿色线条
                              isDense: true,
                              //设置为 true 则输入框的文本垂直方向空隙更小。
//                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            ),
                            // 校验用户名（不能为空）
                            validator: (v) {
                              return v.trim().isNotEmpty ? null : 'isNotEmpty';
                            }),
                      ),
                    ),
                    new Text('搜索',
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            decoration: TextDecoration.none)),
                  ]),
            ),
            new Expanded(
              flex: 2,
              child: new Center(
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.blue),
                  alignment: Alignment.center,
                  child: Text(
                    '$_textFieldValue',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFocus,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
