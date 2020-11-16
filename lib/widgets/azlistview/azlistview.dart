import 'package:flutter/material.dart';
import 'index.dart';
import 'page_scaffold.dart';

///
/// des:
///

//void main() => runApp(MyApp());

class AzlistviewApp extends StatefulWidget {
  @override
  _AzlistviewAppState createState() => _AzlistviewAppState();
}

class _AzlistviewAppState extends State<AzlistviewApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AzListView example app'),
        ),
        body: ListPage([
          PageInfo("City Select", (ctx) => CitySelectRoute()),
          PageInfo("City Select(Custom header)",
              (ctx) => CitySelectCustomHeaderRoute()),
          PageInfo("Contacts List", (ctx) => ContactListRoute()),
          PageInfo(
              "IndexBar & SuspensionView", (ctx) => IndexSuspensionRoute()),
        ]),
      ),
    );
  }
}
