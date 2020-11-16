import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

//void main() => runApp(MyApp());

class FlutterIconsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FlutterIconsPage(title: 'Flutter Icons'),
    );
  }
}

class FlutterIconsPage extends StatefulWidget {
  FlutterIconsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterIconsPageState createState() => _FlutterIconsPageState();
}

class _FlutterIconsPageState extends State<FlutterIconsPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1.0.0 version used
            Icon(AntDesign.stepforward),
            Icon(Ionicons.ios_search),
            Icon(FontAwesome.glass),
            Icon(MaterialIcons.ac_unit),
            Icon(FontAwesome5.address_book),
            Icon(FontAwesome5Solid.address_book),
            Icon(FontAwesome5Brands.$500px),

// After 1.1.0, the FlutterIcons class is provided to access all Icons
// Icon name in the original basis added icon set abbreviation name as suffix
// Hereinafter referred to as the following
//Ant Design Icons -> ant,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> faw,
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Material Community Icons -> mco,
//Material Icons -> mdi,
//Octicons Icons -> oct,
//Simple Line Icons -> sli,
//Zocial Icons -> zoc,
//Weather Icons -> wea
            Icon(FlutterIcons.stepforward_ant),
            Icon(FlutterIcons.html5_faw),

// Previous versions of 1.0.0 are used
//            Icon(Ionicons.getIconData("ios-search")),
//            Icon(AntDesign.getIconData("stepforward")),
//            Icon(FontAwesome.getIconData("glass")),
//            Icon(MaterialIcons.getIconData("ac-unit")),
//            Icon(FontAwesome5.getIconData("address-book")),
//            Icon(FontAwesome5.getIconData("address-book",
//                weight: IconWeight.Solid)),
//            Icon(FontAwesome5.getIconData("500px", weight: IconWeight.Brand)),
          ],
        ),
      ),
    );
  }
}
