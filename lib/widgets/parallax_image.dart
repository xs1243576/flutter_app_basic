import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

///
/// des:
///

//class parallax_image extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

//void main() => runApp(new MyApp());

//A Flutter widget that paints an image and moves it at a slower speed than the main scrolling content.

class ParallaxImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Parallax Image Demo',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new ParallaxImagePage(title: 'Parallax Image Demo'),
    );
  }
}

class ParallaxImagePage extends StatelessWidget {
  ParallaxImagePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
              'Horizontal scroll parallax',
              style: theme.textTheme.title,
            ),
          ),
          new Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            constraints: const BoxConstraints(maxHeight: 200.0),
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildHorizontalChild,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
              'Vertical scroll parallax',
              style: theme.textTheme.title,
            ),
          ),
          new Expanded(
            child: new ListView.builder(
              itemBuilder: _buildVerticalChild,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return null;
    return new Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new GestureDetector(
        onTap: () {
          print('Tapped $index');
        },
        child: new ParallaxImage(
          extent: 150.0,
          image: new ExactAssetImage(
            'images/$index.png',
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return null;
    return new Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: new ParallaxImage(
        extent: 100.0,
        image: new ExactAssetImage(
          'images/$index.png',
        ),
      ),
    );
  }
}


