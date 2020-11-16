import 'package:flutter/material.dart';

///
/// des:
///

class Test2 extends StatefulWidget {
  Test2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2> {
  int _counter = 0;

  GlobalKey globalKey = new GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
  }

//  27、判断页面渲染完毕
  // 渲染完成之后获取某个元素的大小
  void _onAfterRendering(Duration timeStamp) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    double width = renderBox.size.width;
    double height = renderBox.size.height;

    // topLeftPosition
    double x = renderBox.localToGlobal(Offset.zero).dx;
    setState(() {});

    print(
        "semanticBounds:${renderBox.semanticBounds.size} paintBounds:${renderBox.paintBounds.size} size:${globalKey.currentContext.size}");

//    结论：在一般情况下（不在ScrollView中，不是ScrollView），可以通过BuildContext的size方法获取到大小,也可以通过renderObject的paintBounds和semanticBounds获取大小。
//    即使在ScrollView中，也一样。

//    结论：SliverList等Sliver系列的Widget，不能直接使用上述方法获得大小，必须用内部的容器间接获取
//    new SliverList(
//        key:_myKey,
//        delegate: new SliverChildBuilderDelegate(  (BuildContext context,int index){
//
//          return new Column(
//            mainAxisSize: MainAxisSize.min,
//            children: buildRandomWidgets(),
//          );
//
//        },childCount: 1))
//    return new Column(
//      key:_myKey,
//      mainAxisSize: MainAxisSize.min,
//      children: buildRandomWidgets(),
//    );

//    总结一下
//    1 、可以使用GlobalKey找到对应的元素的BuildContext对象
//    2 、通过BuildContext对象的size属性可以获取大小，Sliver系列Widget除外
//    3 、可以通过findRender方法获取到渲染对象，然后使用paintBounds获取到大小。
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('空视图'),
      ),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  color: Colors.amberAccent,
                  width: 300.0,
                  height: 300.0,
                  child: new FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                    child: new Container(
                      color: Colors.red,
                      child: new Text("FittedBox"),
                    ),
                  ),
                ),
                new Container(
                  height: 200.0,
                  child: new AspectRatio(
                    aspectRatio: 1.5,
                    child: new Container(
                      color: Colors.red,
                      child: new Text('最终AspectRatio的是宽300高200的一个区域。'),
                    ),
                  ),
                ),
                new ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100.0,
                    minHeight: 100.0,
                    maxWidth: 150.0,
                    maxHeight: 150.0,
                  ),
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    IconData(0xe64a, fontFamily: 'appIconFonts'),
                    // color: Color(0xFF1afa29),
                  ),
                  onPressed: () {},
                ),
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                new Text('Hello World', style: new TextStyle(fontSize: 32.0)),
                new Image.asset('images/avatar.png', fit: BoxFit.cover),
                new Icon(Icons.star, color: Colors.red[500]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                    ]),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                      new Image.asset('images/star.jpg', width: 60, height: 60),
                    ]),
                new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Expanded(
                        child: new Image.asset('images/star.jpg',
                            width: 60, height: 60),
                      ),
                      new Expanded(
                        child: new Image.asset('images/star.jpg',
                            width: 60, height: 60),
                      ),
                      new Expanded(
                        child: new Image.asset('images/star.jpg',
                            width: 60, height: 60),
                      ),
                    ]),
                new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Expanded(
                        child: new Image.asset('images/star.jpg',
                            width: 60, height: 60),
                      ),
                      new Expanded(
                        flex: 2,
//                    child: new Image.asset('images/star.jpg',width: 60, height: 60),
                        child: new Image.asset('images/star.jpg'),
                      ),
                      new Expanded(
                        child: new Image.asset('images/star.jpg',
                            width: 60, height: 60),
                      ),
                    ]),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
