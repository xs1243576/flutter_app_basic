import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

//void main() => runApp(MyApp());

class liquid_pull_to_refreshApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: liquid_pull_to_refreshPage(title: 'Liquid Pull To Refresh'),
    );
  }
}

class liquid_pull_to_refreshPage extends StatefulWidget {
  liquid_pull_to_refreshPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _liquid_pull_to_refreshPageState createState() => _liquid_pull_to_refreshPageState();
}

class _liquid_pull_to_refreshPageState extends State<liquid_pull_to_refreshPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = new Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Align(alignment: Alignment(-1.0, 0.0), child: Icon(Icons.reorder)),
            Align(alignment: Alignment(-0.3, 0.0), child: Text(widget.title)),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
            stream: counterStream,
            builder: (context, snapshot) {
              return ListView.builder(
                padding: kMaterialListPadding,
                itemCount: _items.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  final String item = _items[index];
                  return ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(child: Text(item)),
                    title: Text('This item represents $item.'),
                    subtitle: Text(
                        'Even more additional list item information appears on line three. ${snapshot.data}'),
                  );
                },
              );
            }),
      ),
    );
  }
}
