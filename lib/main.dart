import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'index.dart';
import 'package:flutter/rendering.dart';

import 'package:camera/camera.dart';
import 'common/Constant.dart';
import 'routers.dart';
import 'routers_one.dart';

//import 'package:amap_map_fluttify/amap_map_fluttify.dart';
//import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'package:get_it/get_it.dart';
import 'widgets/get_it/app_model.dart';

import 'dart:ui';
import 'dart:isolate';

import 'package:flutter_downloader/flutter_downloader.dart';

// import 'package:mxflutter/mxflutter.dart';

//  flutter_local_notifications
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:com.example.flutterappbasic/widgets/flutter_local_notifications.dart';

//import 'package:flutter_bugly/flutter_bugly.dart';

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

//void main() => Global.init().then((e) => runApp(MyApp()));

main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    Constant.cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }

  //使用flutter异常上报
//  void main()=>FlutterBugly.postCatchedException((){
//    runApp(MyApp());
//  });
//  FlutterBugly.init(androidAppId: "your android app id",iOSAppId: "your iOS app id");

//  debugPaintSizeEnabled = true;
  Global.init().then((e) => runApp(MyApp()));
//  Global.init().then((e) => print('e'));
//  runApp(MyApp());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色    这种设置方式状态栏占位
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, statusBarBrightness: Brightness.light));

  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent); // 这种设置方式状态栏不占位
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

//  地图初始化相关  flutter_branch
  await enableFluttifyLog(false);
  await AmapService.init(
    iosKey: '4361cbbe48ac99e4a254134c708325e3',
    androidKey: '3c5accbd5a1a0f5d70caf65945c98087',
  );

  // 注册只能放在runapp方法中，因为只能注册一次
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);

//    WidgetsFlutterBinding.ensureInitialized();
//  await AmapCore.init('2dd410e014ecd20e5d3cbf18363db96b');

//  await enableFluttifyLog(false);
//  await AmapService.init(
//    iosKey: '2dd410e014ecd20e5d3cbf18363db96b',
//    androidKey: '52c1ce14bf08697a2ef790376e2316f7',
//    webApiKey: '2917e3e681fa9ef6c06d1934e114a6ca',
//  );
//  await AmapCore.init('f6422eadda731fb0d9ffb3260a5cf899');

//  android_alarm_manager
  /// The name associated with the UI isolate's [SendPort].
  const String isolateName = 'isolate';

  /// A port used to communicate from a background isolate to the UI isolate.
  final ReceivePort port = ReceivePort();
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );

//flutter_downloader
  await FlutterDownloader.initialize(debug: true);

//  flutter_local_notifications  相关
  Constant.notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });

  //-------1. MXFlutter 启动---------
  // MXJSFlutter.getInstance().runJSApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> router = {};
    router.addAll(routers);
    router.addAll(routersOne);

    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle: (context) {
              return GmLocalizations.of(context).title;
            },
//            home: HomeRoute(),
            home: TabNavigatorOne(),
            locale: const Locale('zh'),
            //localeModel.getLocale(),
            //我们只支持美国英语和中文简体
            supportedLocales: [
              const Locale('en', 'US'), // 美国英语
              const Locale('zh', 'CH'), // 中文简体
              //其它Locales
            ],
            localizationsDelegates: [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate()
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  locale = Locale('en', 'US');
                }
                return locale;
              }
            },
//            localeListResolutionCallback:
//                (List<Locale> locales, Iterable<Locale> supportedLocales) {
//              return Locale('zh');
//            },
//            localeResolutionCallback:
//                (Locale locale, Iterable<Locale> supportedLocales) {
//              return Locale('zh');
//            },
            // 注册路由表
            routes: router,
//            routes: <String, WidgetBuilder>{
//              "login": (context) => LoginRoute(),
//              "themes": (context) => ThemeChangeRoute(),
//              "language": (context) => LanguageRoute(),
//              "camera": (context) => CameraApp(),
//              "PickerImage": (context) => PickerImage(),
//            },
          );
        },
      ),
    );
  }
}
