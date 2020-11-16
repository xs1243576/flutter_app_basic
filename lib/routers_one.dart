import 'package:flutter/material.dart';
import 'routes/index.dart';
import 'widgetsexample/index.dart';

///
/// des:
///

Map<String, WidgetBuilder> routersOne = {
//  "login": (context) {
//  return new LoginRoute();
//  },
//  "themes": (context) {
//    return new ThemeChangeRoute();
//  },
//  "language": (context) {
//    return new LanguageRoute();
//  },
  "Test1": (context) {
    return new Test1();
  },
  "Test2": (context) {
    return new Test2();
  },
  "Test3": (context) {
    return new Test3();
  },
  "Test4": (context) {
    return new Test4();
  },
  "Test5Page": (context) {
    return new Test5Page();
  },
  "Test6 自定义搜索框": (context) {
    return new Test6();
  },
  "Test7Page 动画": (context) {
    return new Test7Page();
  },
  "DemoAppSignature 签名 Canvas draw/paint": (context) {
    return new MaterialApp(home: new DemoAppSignature());
  },
  "Test9 处理来自外部应用程序传入的Intents": (context) {
    return new Test9SampleApp();
  },
  "Test10 ": (context) {
    return new Test10Page();
  },
  "Test11Page ListTitle": (context) {
    return new Test11Page();
  },
  "WebSocketChannelApp": (context) {
    return new WebSocketChannelApp();
  },
};
