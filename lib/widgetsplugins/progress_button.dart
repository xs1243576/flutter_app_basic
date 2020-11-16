import 'package:flutter/material.dart';
import 'package:progress_button/progress_button.dart';

///
/// des:
///

class progress_buttonPage extends StatefulWidget {
  progress_buttonPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _progress_buttonPageState createState() => _progress_buttonPageState();
}

class _progress_buttonPageState extends State<progress_buttonPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void VoidCallback() {}

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            ProgressButton(
              child: Text("Login"),
              onPressed: VoidCallback,
              buttonState: ButtonState.normal,
              backgroundColor: Theme.of(context).primaryColor,
              progressColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
