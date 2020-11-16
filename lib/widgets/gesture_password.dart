import 'package:flutter/material.dart';
import 'package:gesture_password/gesture_password.dart';
import 'package:gesture_password/mini_gesture_password.dart';

///
/// des:
///

//void main() => runApp(new MyApp());

class GesturePasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new GesturePasswordPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class GesturePasswordPage extends StatefulWidget {
  GesturePasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GesturePasswordPageState createState() => new _GesturePasswordPageState();
}

class _GesturePasswordPageState extends State<GesturePasswordPage> {
  GlobalKey<_GesturePasswordPageState> miniGesturePassword =
  new GlobalKey<_GesturePasswordPageState>();

  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: scaffoldState,
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Column(
          children: <Widget>[
            new Center(
                child: new MiniGesturePassword(key: miniGesturePassword)),
            new LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return new Container(
                  color: Colors.red,
                  margin: const EdgeInsets.only(top: 100.0),
                  child: new GesturePassword(
                    width: 200.0,
                    successCallback: (s) {
                      print("successCallback$s");
                      scaffoldState.currentState?.showSnackBar(new SnackBar(
                          content: new Text('successCallback:$s')));
//                      miniGesturePassword.currentState?.setSelected('');
                    },
                    failCallback: () {
                      print('failCallback');
                      scaffoldState.currentState?.showSnackBar(
                          new SnackBar(content: new Text('failCallback')));
//                      miniGesturePassword.currentState?.setSelected('');
                    },
                    selectedCallback: (str) {
//                      miniGesturePassword.currentState?.setSelected(str);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

