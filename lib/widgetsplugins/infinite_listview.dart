import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';

//void main() => runApp(infinite_listviewApp());

class infinite_listviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: infinite_listviewScreen(),
    );
  }
}

class infinite_listviewScreen extends StatefulWidget {
  @override
  _infinite_listviewScreenState createState() => _infinite_listviewScreenState();
}

class _infinite_listviewScreenState extends State<infinite_listviewScreen> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('infinite_listview'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () {
                _infiniteController.animateTo(
                    _infiniteController.offset + 2000.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () {
                _infiniteController.animateTo(
                    _infiniteController.offset - 2000.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'First'),
              Tab(text: 'Second'),
              Tab(text: 'Third'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildTab(0),
            _buildTab(1),
            _buildTab(2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Tab $tab Item #$index'),
              subtitle: Text('Subtitle $index'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 2.0),
      anchor: 0.5,
    );
  }
}
