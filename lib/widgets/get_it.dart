import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'get_it/app_model.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

//void main() {
//  getIt.registerSingleton<AppModel>(AppModelImplementation(),
//      signalsReady: true);
//
//  runApp(MyApp());
//}

class GetItApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetItPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class GetItPage extends StatefulWidget {
  GetItPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GetItPageState createState() => _GetItPageState();
}

class _GetItPageState extends State<GetItPage> {
  @override
  initState() {
//    // 注册只能放在runapp方法中，因为只能注册一次
//    getIt.registerSingleton<AppModel>(AppModelImplementation(),
//        signalsReady: true);
    // Access the instance of the registered AppModel
    // As we don't know for sure if AppModel is already ready we use getAsync
    getIt
        .isReady<AppModel>()
        .then((_) => getIt<AppModel>().addListener(update));
    // Alternative
    // getIt.get<AppModel>().addListener(update);

    super.initState();
  }

  @override
  void dispose() {
    getIt<AppModel>().removeListener(update);
    super.dispose();
  }

  update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
          future: getIt.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                      ),
                      Text(
                        getIt<AppModel>().counter.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: getIt<AppModel>().incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Waiting for initialisation'),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(),
                ],
              );
            }
          }),
    );
  }
}

