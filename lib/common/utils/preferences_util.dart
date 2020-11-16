import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
//  static SharedPreferences _prefs;

  static saveStr(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static getStr(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  //增加方法
  static void _addList(String key,List<String> data) async {
    //初始化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String content = '今天吃啥捏';
    data.add(content); //List<String> data = [];
    prefs.setStringList(key, data); //添加元素是string类型的List
  }

  static Future<List<String>> _getList(String keyname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyname);
  }

  //查询方法
  static void _showList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.get(key);
//    if (prefs.getStringList(key) != null) {
      //更新状态
//      setState(() {
//        data = prefs.getStringList('title');
//      });
//    }
  }

  //删除
  static void _clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();//把所有的key 和value 都删除了
  }

//  static Future<String> get() async {
//    var userName;
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    userName = prefs.getString(mUserName);
//    return userName;
//  }

}