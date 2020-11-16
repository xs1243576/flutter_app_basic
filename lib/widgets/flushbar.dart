import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

///
/// des:
///

class FlushBarApp extends StatefulWidget {
  @override
  _FlushBarAppState createState() => _FlushBarAppState();
}

class _FlushBarAppState extends State<FlushBarApp> {
//  AnimationController _controller = AnimationController(
//    vsync: this,
//    duration: Duration(seconds: 3),
//  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourAwesomeApp',
      home: Scaffold(
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text("MaterialButton"),
                onPressed: () {
                  Flushbar(
                    title: "Hey Ninja",
                    margin: EdgeInsets.all(8),
                    borderRadius: 8,
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: Colors.blue[300],
                    ),
                    leftBarIndicatorColor: Colors.blue[300],
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
              ),
//              MaterialButton(
//                child: Text("MaterialButton"),
//                onPressed: () {
//                  Flushbar(
//                    title: "Hey Ninja",
//                    message:
//                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//                    showProgressIndicator: true,
//                    progressIndicatorController: _controller,
//                    progressIndicatorBackgroundColor: Colors.grey[800],
//                    duration: Duration(seconds: 3),
//                  )..show(context);
//                },
//              ),
              MaterialButton(
                child: Text("MaterialButton"),
                onPressed: () {
                  Flushbar(
                    borderRadius: 8,
                    title: "Hey Ninja",
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    ),
                    mainButton: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    // <
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
              ),
              MaterialButton(
                child: Text("MaterialButton"),
                onPressed: () {
                  Flushbar(
                    title: "Hey Ninja",
                    //ignored since titleText != null
                    duration: Duration(seconds: 3),
                    backgroundGradient:
                        LinearGradient(colors: [Colors.blue, Colors.teal]),
                    backgroundColor: Colors.red,
                    boxShadows: [
                      BoxShadow(
                        color: Colors.blue[800],
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      )
                    ],
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    //ignored since messageText != null
                    titleText: Text(
                      "Hello Hero",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.yellow[600],
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                    messageText: Text(
                      "You killed that giant monster in the city. Congratulations!",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                  )..show(context);
                },
              ),
              MaterialButton(
                child: Text("MaterialButton"),
                onPressed: () {
                  Flushbar(
                    title: "Hey Ninja",
                    margin: EdgeInsets.all(8),
                    borderRadius: 8,
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: Colors.blue[300],
                    ),
                    leftBarIndicatorColor: Colors.blue[300],
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
              ),
              MaterialButton(
                child: Text("MaterialButton2"),
                onPressed: () {
                  Flushbar(
                    title: "Hey Ninja",
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    flushbarPosition: FlushbarPosition.TOP,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    reverseAnimationCurve: Curves.decelerate,
                    forwardAnimationCurve: Curves.elasticOut,
                    backgroundColor: Colors.red,
                    boxShadows: [
                      BoxShadow(
                          color: Colors.blue[800],
                          offset: Offset(0.0, 2.0),
                          blurRadius: 3.0)
                    ],
                    backgroundGradient:
                        LinearGradient(colors: [Colors.blueGrey, Colors.black]),
                    isDismissible: false,
                    duration: Duration(seconds: 3),
                    icon: Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    ),
                    mainButton: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "CLAP",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Colors.blueGrey,
                    titleText: Text(
                      "Hello Hero",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.yellow[600],
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                    messageText: Text(
                      "You killed that giant monster in the city. Congratulations!",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.green,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                  )..show(context);
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
