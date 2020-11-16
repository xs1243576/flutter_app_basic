import 'dart:io';

import 'json_table/custom_data_table.dart';
import 'json_table/local_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'json_table/custom_column_nested_table.dart';
import 'json_table/custom_column_table.dart';
import 'json_table/simple_table.dart';

//void enablePlatformOverrideForDesktop() {
//  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
//    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//  }
//}
//
//void main() {
//  enablePlatformOverrideForDesktop();
//
//  runApp(MyApp());
//}

class JsonTableApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Table Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RootPage(),
// When navigating to the "/second" route, build the SecondScreen widget.
        '/customData': (context) => CustomDataTable(),
      },
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Table Widget"),
          actions: [
            FlatButton(
              child: Text(
                "TEST LIVE",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/customData');
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Simple Table",
              ),
              Tab(
                text: "Custom Table",
              ),
              Tab(
                text: "Nested Data Table",
              ),
              Tab(
                text: "Local Data Table",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SimpleTable(),
            CustomColumnTable(),
            CustomColumnNestedTable(),
            LocalTable(),
          ],
        ),
      ),
    );
  }
}
