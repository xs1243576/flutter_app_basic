import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

//void main() {
//  runApp(MyApp());
//}

class WechatCameraPickerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WechatCameraPickerPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class WechatCameraPickerPage extends StatefulWidget {
  const WechatCameraPickerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WechatCameraPickerPageState createState() => _WechatCameraPickerPageState();
}

class _WechatCameraPickerPageState extends State<WechatCameraPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CameraPicker.pickFromCamera(
            context,
            isAllowRecording: true,
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.camera_enhance),
      ),
    );
  }
}
