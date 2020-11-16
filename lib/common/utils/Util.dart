import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:collection';
import 'package:strings/strings.dart';
import 'package:string_validator/string_validator.dart';

///
/// des:
///

class Util {
  static String username = '';
  static String id = '';

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

//  这里提供一个很巧妙的方法判断当前应用是否运行在debug模式下，示例代码如下：
//  flutter中如何判断当前应用处于debug模式？
  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true); //如果debug模式下会触发赋值
    return inDebugMode;
  }

  // flutter延时执行
  static delayed(int milliseconds, VoidCallback voidCallback) {
    // 延时milliseconds执行返回
    Future.delayed(Duration(milliseconds: milliseconds), voidCallback);
  }

//  使用: DelayedUtil.delayed(3000, () { });

//  将hex字符串转换为base64的方法如下：
  static String hex2base64(String hex) {
    if (isEmpty(hex)) {
      return null;
    }
    if (hex.length % 2 != 0) {
      return null;
    }
    String base64String = '';
    try {
      for (int i = 0; i < hex.length / 2; i++) {
        int code = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
        base64String += String.fromCharCode(code);
      }
      String str = '';
      Uint8List result = base64.decode(base64String);
      result.forEach((int v) {
        str += String.fromCharCode(v);
      });
      return str;
    } catch (err) {
      return null;
    }
  }

//fileExt 文件后缀名
  static MediaType getMediaType(final String fileExt) {
    switch (fileExt.toLowerCase()) {
      case ".jpg":
      case ".jpeg":
      case ".jpe":
        return new MediaType("image", "jpeg");
      case ".png":
        return new MediaType("image", "png");
      case ".bmp":
        return new MediaType("image", "bmp");
      case ".gif":
        return new MediaType("image", "gif");
      case ".json":
        return new MediaType("application", "json");
      case ".svg":
      case ".svgz":
        return new MediaType("image", "svg+xml");
      case ".mp3":
        return new MediaType("audio", "mpeg");
      case ".mp4":
        return new MediaType("video", "mp4");
      case ".mov":
        return new MediaType("video", "mov");
      case ".htm":
      case ".html":
        return new MediaType("text", "html");
      case ".css":
        return new MediaType("text", "css");
      case ".csv":
        return new MediaType("text", "csv");
      case ".txt":
      case ".text":
      case ".conf":
      case ".def":
      case ".log":
      case ".in":
        return new MediaType("text", "plain");
    }
    return null;
  }
}
