import 'package:flutter/material.dart';

import 'fl_chart/bar_chart/bar_chart_page.dart';
import 'fl_chart/bar_chart/bar_chart_page2.dart';
import 'fl_chart/line_chart/line_chart_page.dart';
import 'fl_chart/line_chart/line_chart_page2.dart';
import 'fl_chart/line_chart/line_chart_page3.dart';
import 'fl_chart/line_chart/line_chart_page4.dart';
import 'fl_chart/pie_chart/pie_chart_page.dart';
import 'fl_chart/scatter_chart/scatter_chart_page.dart';

//void main() => runApp(MyApp());

class FlChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlChart Demo',
      showPerformanceOverlay: false,
      theme: ThemeData(
        primaryColor: const Color(0xff262545),
        primaryColorDark: const Color(0xff201f39),
        brightness: Brightness.dark,
      ),
      home: const FlChartPage(title: 'fl_chart'),
    );
  }
}

class FlChartPage extends StatefulWidget {
  const FlChartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlChartPageState createState() => _FlChartPageState();
}

class _FlChartPageState extends State<FlChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: <Widget>[
            LineChartPage(),
            BarChartPage(),
            BarChartPage2(),
            PieChartPage(),
            LineChartPage2(),
            LineChartPage3(),
            LineChartPage4(),
            ScatterChartPage(),
          ],
        ),
      ),
    );
  }
}

