import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';


class MapLocationPage extends StatefulWidget {
  const MapLocationPage({
    Key key,

    /// If set, enable the FusedLocationProvider on Android
    @required this.androidFusedLocation,
  }) : super(key: key);
  final bool androidFusedLocation;

  @override
  _MapLocationPageState createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {
  Position _lastKnownPosition;
  Position _currentPosition;

  // 很重要
  // 定位相关请求看github，有说明，还有权限相关
  @override
  void initState() {
    super.initState();

//    _initLastKnownLocation();  初始化会报错  position.latitude 为 null
    _initCurrentLocation();  //  forceAndroidLocationManager  要为true，否则获取不到定位经纬度信息
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _lastKnownPosition = null;
      _currentPosition = null;
    });

    _initLastKnownLocation().then((_) => _initCurrentLocation());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initLastKnownLocation() async {
    Position position;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager = false;//!widget.androidFusedLocation;
      position = await geolocator.getLastKnownPosition(
          desiredAccuracy: LocationAccuracy.best);
    } on PlatformException {
      position = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _lastKnownPosition = position;
      this.htmlStr = htmlStr1+position.latitude.toString()+","+position.longitude.toString()+htmlStr2;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  _initCurrentLocation() {
    Geolocator()
      ..forceAndroidLocationManager = true//!widget.androidFusedLocation
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      ).then((position) {
        if (mounted) {
          setState(() => _currentPosition = position);
          print(position.latitude.toString()+","+position.longitude.toString());
          this.htmlStr = htmlStr1+position.latitude.toString()+","+position.longitude.toString()+htmlStr2;
        }
      }).catchError((e) {
        //
      });
  }


  WebViewController _controller;
  String _title = "webview";
  double _height = 1.0;
  String htmlStr = "";
  String htmlStr1 = '''
  <!doctype html><html><head><meta charset="utf-8"><title></title><meta name="keywords" content="" /><meta name="description" content="" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
            <meta name="format-detection" content="telephone=no" /><meta name="apple-mobile-web-app-capable" content="yes" />
            <meta name="apple-mobile-web-app-status-bar-style" content="black"><meta name="author" content="CSS5, css5.com.cn" />
            <script type="text/javascript" src="//3gimg.qq.com/lightmap/components/locationPicker2/js/main-62c2e3b971.js"></script>
            <script type="text/javascript">
                window.addEventListener('message', function(event) {
                var loc = event.data;
                Toaster.postMessage(JSON.stringify(loc));
                }, false)
              </script>
            <style>body{font-size:62.5%;font-family:"Microsoft YaHei",Arial; overflow-x:hidden; overflow-y:auto;}.viewport{ min-width:300px; margin:0 auto;}</style>
            </head>
            <body>
            <iframe id="iframe" width="100%" height=650 frameborder=0
            src="https://apis.map.qq.com/tools/locpicker?search=1&type=1&zoom=15&coord=
            ''';
  String htmlStr2 = '''
            &key=BHVBZ-UIO66-BTHSB-EJP62-EYFBQ-JHFWL&referer=时间银行"></iframe>
            </body>
            </html>
  ''';

  // 代码编写不规范导致闪退
//  <script type="text/javascript">
//      function callFlutter(){
//    Toaster.postMessage('js call flutter');
//  }
//  window.addEventListener('message', function(event) {
//    var loc = event.data;
//    window.postMessage(JSON.stringify(loc));
//    Toaster.postMessage(JSON.stringify(loc));
//
//  }, false)
//  </script>

  // $ 符号会报错
//  <script>$(function(){ adaptHeight();window.onresize = function() { adaptHeight(); }
//  function adaptHeight() { var winH = $(window).height();  var bodyH = document.documentElement.clientHeight; if (winH > bodyH){
//    window.parent.document.getElementById("iframe").height=winH;} else {window.parent.document.getElementById("iframe").height=bodyH;}}});</script>

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GeolocationStatus>(
        future: Geolocator().checkGeolocationPermissionStatus(),
        builder:
            (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == GeolocationStatus.denied) {
            return const PlaceholderWidget('Access to location denied',
                'Allow access to the location services for this App using the device settings.');
          }

          print("--snapshot.data--"+snapshot.data.toString());

          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("$_title"),
            ),
            child: SafeArea(
              child: WebView(
                initialUrl: "https://flutterchina.club/",
                //JS执行模式 是否允许JS执行
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _controller = controller;
                  controller.loadUrl(Uri.dataFromString(htmlStr, // htmlStr1+htmlStr2  不包含经纬度信息   htmlStr 包含经纬度信息可能会出错
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'))
                      .toString());
                },
                onPageFinished: (url) {
                  _controller.evaluateJavascript("document.title").then((result){
                    setState(() {
                      _title = result;
                    });
                  }
                  );
                  //调用JS得到实际高度
                  _controller.evaluateJavascript("document.documentElement.clientHeight;").then((result){
                    setState(() {
                      _height = double.parse(result);
                      print("高度$_height");
                    });
                  }
                  );
                },
                navigationDelegate: (NavigationRequest request) {
                  if(request.url.startsWith("myapp://")) {
                    print("即将打开 ${request.url}");

                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                javascriptChannels: <JavascriptChannel>[
                  JavascriptChannel(
                      name: "Toaster",
                      onMessageReceived: (JavascriptMessage message) {
                        print("参数： ${message.message}");
                      }
                  ),
                ].toSet(),

              ),
            ),
          );
        });
  }

  @override
  Widget buildCopy(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$_title"),
      ),
      child: SafeArea(
        child: WebView(
          initialUrl: "https://flutterchina.club/",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
            controller.loadUrl(Uri.dataFromString(htmlStr,
                          mimeType: 'text/html',
                          encoding: Encoding.getByName('utf-8'))
                      .toString());
          },
          onPageFinished: (url) {
            _controller.evaluateJavascript("document.title").then((result){
              setState(() {
                _title = result;
              });
            }
            );
            //调用JS得到实际高度
            _controller.evaluateJavascript("document.documentElement.clientHeight;").then((result){
              setState(() {
                _height = double.parse(result);
                print("高度$_height");
              });
            }
            );
          },
          navigationDelegate: (NavigationRequest request) {
            if(request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "Toaster",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                }
            ),
          ].toSet(),

        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget(this.title, this.message);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: const TextStyle(fontSize: 32.0, color: Colors.black54),
              textAlign: TextAlign.center),
          Text(message,
              style: const TextStyle(fontSize: 16.0, color: Colors.black54),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

