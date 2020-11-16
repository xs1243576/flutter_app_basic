import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:native_widgets/native_widgets.dart';

import '../routes/empty_page.dart';
import 'screens/page_1.dart';
import 'screens/page_2.dart';
import 'screens/page_3.dart';
import 'screens/page_4.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

// 为避免重复代码，只编写一次代码就可以支持两个平台并自动根据平台自动使用对应风格组件，Android将使用材料设计，iOS将使用Cupertino风格的小部件。

// The existing imports
// !! Keep your existing impots here !!

/// main is entry point of Flutter application
//void main() {
//  // Desktop platforms aren't a valid platform.
//  if (!kIsWeb) _setTargetPlatformForDesktop();
//  return runApp(MyApp());
//}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
//void _setTargetPlatformForDesktop() {
//  TargetPlatform targetPlatform;
//  if (Platform.isMacOS) {
//    targetPlatform = TargetPlatform.iOS;
//  } else if (Platform.isLinux || Platform.isWindows) {
//    targetPlatform = TargetPlatform.android;
//  }
//  if (targetPlatform != null) {
//    debugDefaultTargetPlatformOverride = targetPlatform;
//  }
//}

class NativeWidgetsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('he', 'IL'),
      ],
      home: NativeAppLook(),
    );
  }
}

class NativeAppLook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NativeTabScaffold(
      tabs: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text("Info"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("Table"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("Table"),
        ),
      ],
      pages: <NativeTabView>[
        NativeTabView(
          title: "Input Form",
          child: Page1(),
        ),
        NativeTabView(
          title: "Nav Demo",
          child: Page2(),
        ),
        NativeTabView(
          title: "Table View",
          child: Page3(),
        ),
        NativeTabView(
          title: "Table View",
          child: CupertinoPickerDemo(),
        ),
      ],
    );
  }
}
