import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//void main() => runApp(MyApp());

class GoogleFontsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleFontsPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class GoogleFontsPage extends StatefulWidget {
  GoogleFontsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GoogleFontsPageState createState() => _GoogleFontsPageState();
}

class _GoogleFontsPageState extends State<GoogleFontsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.headline4;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.oswald(textStyle: display1),
            ),
            Text(
              '$_counter',
              style: GoogleFonts.lato(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

