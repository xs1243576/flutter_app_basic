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
  "WebSocketChannelApp": (context) {
    return new WebSocketChannelApp();
  },
};
