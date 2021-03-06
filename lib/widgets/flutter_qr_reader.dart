import 'package:flutter/material.dart';

import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'scanViewDemo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

//void main() => runApp(MyApp());

class FlutterQrReaderApp extends StatefulWidget {
  @override
  _FlutterQrReaderAppState createState() => _FlutterQrReaderAppState();
}

class _FlutterQrReaderAppState extends State<FlutterQrReaderApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FlutterQrReaderPage());
  }
}

class FlutterQrReaderPage extends StatefulWidget {
  FlutterQrReaderPage({Key key}) : super(key: key);

  @override
  _FlutterQrReaderPageState createState() => new _FlutterQrReaderPageState();
}

class _FlutterQrReaderPageState extends State<FlutterQrReaderPage> {
  QrReaderViewController _controller;
  bool isOk = false;
  String data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () async {
//                Map<PermissionGroup, PermissionStatus> permissions =
//                    await PermissionHandler()
//                        .requestPermissions([PermissionGroup.camera]);
//                print(permissions);
                final status = await Permission.camera.request();// 请求权限需要加await 否则返回的一直是false
//                if (permissions[PermissionGroup.camera] ==
//                    PermissionStatus.granted) {
                print((status == PermissionStatus.granted));
                if (status == PermissionStatus.granted) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Text("ok"),
                      );
                    },
                  );
                  setState(() {
                    isOk = true;
                  });
                }
              },
              child: Text("请求权限"),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanViewDemo()));
              },
              child: Text("独立UI"),
            ),
            FlatButton(
                onPressed: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  final rest = await FlutterQrReader.imgScan(image);
                  setState(() {
                    data = rest;
                  });
                },
                child: Text("识别图片")),
            FlatButton(
                onPressed: () {
                  assert(_controller != null);
                  _controller.setFlashlight();
                },
                child: Text("切换闪光灯")),
            FlatButton(
                onPressed: () {
                  assert(_controller != null);
                  _controller.startCamera(onScan);
                },
                child: Text("开始扫码（暂停后）")),
            if (data != null) Text(data),
            if (isOk)
              Container(
                width: 320,
                height: 350,
                child: QrReaderView(
                  width: 320,
                  height: 350,
                  callback: (container) {
                    this._controller = container;
                    _controller.startCamera(onScan);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  void onScan(String v, List<Offset> offsets) {
    print([v, offsets]);
    setState(() {
      data = v;
    });
    _controller.stopCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
