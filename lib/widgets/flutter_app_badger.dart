import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

//void main() => runApp(new MyApp());

//Plugin to update the app badge on the launcher (both for Android and iOS)
//更新启动器上的app标签的插件(适用于Android和iOS)

//Then you can add a badge:
//FlutterAppBadger.updateBadgeCount(1);
//Remove a badge:
//FlutterAppBadger.removeBadge();
//Or just check if the device supports this feature with:
//FlutterAppBadger.isAppBadgeSupported();

class FlutterAppBadgerApp extends StatefulWidget {
  @override
  _FlutterAppBadgerState createState() => new _FlutterAppBadgerState();
}

class _FlutterAppBadgerState extends State<FlutterAppBadgerApp> {
  String _appBadgeSupported = 'Unknown';

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _appBadgeSupported = appBadgeSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new SizedBox.expand(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text('Badge supported: $_appBadgeSupported\n'),
              new RaisedButton(
                child: new Text('Add badge'),
                onPressed: () {
                  _addBadge();
                },
              ),
              new RaisedButton(
                  child: new Text('Remove badge'),
                  onPressed: () {
                    _removeBadge();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _addBadge() {
    FlutterAppBadger.updateBadgeCount(1);
  }

  void _removeBadge() {
    FlutterAppBadger.removeBadge();
  }
}
