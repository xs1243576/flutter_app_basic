import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_core/core.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//void main() {
//  // Register your license here
//  SyncfusionLicense.registerLicense('ADD YOUR LICENSE KEY HERE');
//  return runApp(_RangeSelectorApp());
//}

class SlidersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Range Selector Demo',
      home: _SlidersPage(),
    );
  }
}

class _SlidersPage extends StatefulWidget {
  const _SlidersPage({Key key}) : super(key: key);

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<_SlidersPage> {
  _SlidersState();

  final List<_Data> chartData = <_Data>[
    _Data(x: DateTime(2003, 01, 01), y: 3.4),
    _Data(x: DateTime(2004, 01, 01), y: 2.8),
    _Data(x: DateTime(2005, 01, 01), y: 1.6),
    _Data(x: DateTime(2006, 01, 01), y: 2.3),
    _Data(x: DateTime(2007, 01, 01), y: 2.5),
    _Data(x: DateTime(2008, 01, 01), y: 2.9),
    _Data(x: DateTime(2009, 01, 01), y: 3.8),
    _Data(x: DateTime(2010, 01, 01), y: 2.0),
  ];

  final DateTime dateMin = DateTime(2003, 01, 01);
  final DateTime dateMax = DateTime(2010, 01, 01);
  final SfRangeValues dateValues =
      SfRangeValues(DateTime(2005, 01, 01), DateTime(2008, 01, 01));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter Range Selector'),
      ),
      body: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SfRangeSelector(
                    min: dateMin,
                    max: dateMax,
                    initialValues: dateValues,
                    labelPlacement: LabelPlacement.betweenTicks,
                    interval: 1,
                    dateIntervalType: DateIntervalType.years,
                    dateFormat: DateFormat.y(),
                    showTicks: true,
                    showLabels: true,
                    child: Container(
                      child: SfCartesianChart(
                        margin: const EdgeInsets.all(0),
                        primaryXAxis: DateTimeAxis(
                          minimum: dateMin,
                          maximum: dateMax,
                          isVisible: false,
                        ),
                        primaryYAxis: NumericAxis(isVisible: false, maximum: 4),
                        series: <SplineAreaSeries<_Data, DateTime>>[
                          SplineAreaSeries<_Data, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (_Data sales, _) => sales.x,
                              yValueMapper: (_Data sales, _) => sales.y)
                        ],
                      ),
                      height: 200,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class _Data {
  _Data({this.x, this.y});

  final DateTime x;
  final double y;
}
