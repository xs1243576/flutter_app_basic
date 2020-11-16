import 'package:flutter/material.dart';

///
/// des:
///

class Test7Page extends StatefulWidget {
  Test7Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test7PageState createState() => _Test7PageState();
}

class _Test7PageState extends State<Test7Page> with TickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  AnimationController controller;
  CurvedAnimation curve;
  var slider = 5.0;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('空视图'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Slider(
              label: this.slider.toString(),
              divisions: 20,
              value: this.slider,
              max: 100.0,
              min: 0.0,
              activeColor: Colors.blue,
              inactiveColor: Colors.yellow,
              onChanged: (double val) {
                this.setState(() {
                  this.slider = val;
                });
              },
              onChangeEnd: (double val) {},
              onChangeStart: (double val) {},
            ),
            new CustomButton("Hello"),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Center(
                child: new Container(
                    child: new FadeTransition(
                        opacity: curve,
                        child: new FlutterLogo(
                          size: 100.0,
                        )))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}
