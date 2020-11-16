import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide PageView;
import 'Custom_PageView.dart' as Custom_PageView;

import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'discover_page.dart';
import 'home_page_one.dart';
import 'message_page.dart';
import 'my_page.dart';
import 'empty_page.dart';

List<Widget> pagesOne = <Widget>[
  HomePageOne(),
  DiscoverPage(),
//  EmptyPage(),
  MessagePage(),
  MyPage(),
];

class TabNavigatorOne extends StatefulWidget {
  TabNavigatorOne({Key key}) : super(key: key);

  @override
  _TabNavigatorOneState createState() => _TabNavigatorOneState();
}

class _TabNavigatorOneState extends State<TabNavigatorOne> {
  List titles = ["首页", "发现", '', "消息", "我的"];
  TextStyle styleNoSelect = TextStyle(fontSize: 12, color: Colors.black);
  TextStyle styleSelect = TextStyle(fontSize: 13, color: Colors.blue);

  var _pageController = PageController();

//  int _selectedIndex = 0;
  DateTime _lastPressed;

  // 底部tabbar
  int currentIndex;
  double redPotTop = 0.0;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: Custom_PageView.PageView.builder(
          cacheCount: 4,
          itemBuilder: (ctx, index) => pagesOne[index],
          itemCount: pagesOne.length,
          controller: _pageController,
//          physics: NeverScrollableScrollPhysics(),
          physics: AlwaysScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
//              _selectedIndex = index;
              currentIndex = index > 1 ? index + 1 : index;
// 通过controller.page.round();获取PageView显示的index，赋值给currentIndex
//              currentIndex = _pageController.page.round();
            });
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //背景颜色
//        color: Colors.orange,
        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 6, 0.0, 6),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
//                      verticalDirection: VerticalDirection.down,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
//                         ImageIcon(
//                           AssetImage('images/avatar.png'),
//                           size: 30,
//                         ),
                        IconButton(
                          icon: Icon(
                            currentIndex == 0 ? Icons.home : Icons.home,
                          ),
                          color: Colors.blue,
//                          iconSize: 30,
//                          padding: EdgeInsets.fromLTRB(0.0, 5, 0.0, 0.0),
//                          padding: EdgeInsets.all(0),
//                          padding: EdgeInsets.symmetric(),
//                          padding: EdgeInsets.symmetric(vertical:0.0,horizontal:0.0),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(40, 30)),
                        ),
                        Text(
                          titles[0],
                          style:
                              currentIndex == 0 ? styleSelect : styleNoSelect,
                        )
                      ],
                    ),
                    // IconButton(
                    //     icon: Icon(
                    //         currentIndex == 0 ? Icons.hot_tub : Icons.home),
                    //     color: currentIndex == 0 ? Colors.blue : Colors.orange),
                    // Text(
                    //   titles[0],
                    //   style: currentIndex == 0 ? styleSelect : styleNoSelect,
                    // ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 9 / 3 * 2,
                      top: redPotTop,
                      child: GStyle.badge(13,
                          color: Colors.red, height: 12.0, width: 12.0),
                    )
                  ],
                ),
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     IconButton(
                //         icon: Icon(
                //             currentIndex == 0 ? Icons.hot_tub : Icons.home)),
                //     Text(
                //       titles[0],
                //       style: currentIndex == 0 ? styleSelect : styleNoSelect,
                //     )
                //   ],
                // ),
                onTap: () {
                  print('0');
                  if (currentIndex != 0) {
                    setState(() {
                      currentIndex = 0;
                    });
//                    _pageController.jumpToPage(0);
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            Container(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // ImageIcon(
                        //   AssetImage('images/sea.png'),
                        // ),
                        IconButton(
                          icon: Icon(currentIndex == 1
                              ? Icons.find_in_page
                              : Icons.find_in_page),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(40, 30)),
                        ),
                        Text(
                          titles[1],
                          style:
                              currentIndex == 1 ? styleSelect : styleNoSelect,
                        ),
                      ],
                    ),
                    // IconButton(
                    //     icon: Icon(currentIndex == 1
                    //         ? Icons.business_center
                    //         : Icons.business),
                    //     color: currentIndex == 1 ? Colors.blue : Colors.orange),
                    // Text(
                    //   titles[1],
                    //   style: currentIndex == 1 ? styleSelect : styleNoSelect,
                    // ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 9 / 3 * 2,
                      top: redPotTop,
                      child: GStyle.badge(0, isdot: true),
                    )
                  ],
                ),
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     IconButton(
                //         icon: Icon(currentIndex == 1
                //             ? Icons.business_center
                //             : Icons.business)),
                //     Text(
                //       titles[1],
                //       style: currentIndex == 1 ? styleSelect : styleNoSelect,
                //     ),
                //   ],
                // ),
                onTap: () {
                  print('1');
                  if (currentIndex != 1) {
                    setState(() {
                      currentIndex = 1;
                    });
//                    _pageController.jumpToPage(1);
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            SizedBox(), //中间位置空出
            Container(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // ImageIcon(
                        //   AssetImage('images/sea.png'),
                        // ),
                        IconButton(
                          icon: Icon(currentIndex == 3
                              ? Icons.message
                              : Icons.message),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(40, 30)),
                        ),
                        Text(
                          titles[3],
                          style:
                              currentIndex == 3 ? styleSelect : styleNoSelect,
                        ),
                      ],
                    ),
                    // IconButton(
                    //     icon: Icon(currentIndex == 1
                    //         ? Icons.business_center
                    //         : Icons.business),
                    //     color: currentIndex == 1 ? Colors.blue : Colors.orange),
                    // Text(
                    //   titles[1],
                    //   style: currentIndex == 1 ? styleSelect : styleNoSelect,
                    // ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 9 / 3 * 2,
                      top: redPotTop,
                      child: GStyle.badge(0, isdot: true),
                    )
                  ],
                ),
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     IconButton(
                //         icon: Icon(currentIndex == 1
                //             ? Icons.business_center
                //             : Icons.business)),
                //     Text(
                //       titles[1],
                //       style: currentIndex == 1 ? styleSelect : styleNoSelect,
                //     ),
                //   ],
                // ),
                onTap: () {
                  print('3');
                  if (currentIndex != 3) {
                    setState(() {
                      currentIndex = 3;
                    });
//                    _pageController.jumpToPage(2);
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            Container(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // ImageIcon(
                        //   AssetImage('images/sea.png'),
                        // ),
                        IconButton(
                          icon: Icon(currentIndex == 4
                              ? Icons.portrait
                              : Icons.portrait),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(40, 30)),
                        ),
                        Text(
                          titles[4],
                          style:
                              currentIndex == 4 ? styleSelect : styleNoSelect,
                        ),
                      ],
                    ),
                    // IconButton(
                    //     icon: Icon(currentIndex == 1
                    //         ? Icons.business_center
                    //         : Icons.business),
                    //     color: currentIndex == 1 ? Colors.blue : Colors.orange),
                    // Text(
                    //   titles[1],
                    //   style: currentIndex == 1 ? styleSelect : styleNoSelect,
                    // ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 9 / 3 * 2,
                      top: redPotTop,
                      child: GStyle.badge(0, isdot: true),
                    )
                  ],
                ),
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     IconButton(
                //         icon: Icon(currentIndex == 1
                //             ? Icons.business_center
                //             : Icons.business)),
                //     Text(
                //       titles[1],
                //       style: currentIndex == 1 ? styleSelect : styleNoSelect,
                //     ),
                //   ],
                // ),
                onTap: () {
                  print('1');
                  if (currentIndex != 4) {
                    setState(() {
                      currentIndex = 4;
                    });
//                    _pageController.jumpToPage(3);
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("PickerImage");
          }),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }
}

class GStyle {
  // 消息红点
  static badge(int count,
      {Color color = Colors.red,
      bool isdot = false,
      double height = 18.0,
      double width = 18.0}) {
    final _num = count > 99 ? '···' : count;
    return Container(
        alignment: Alignment.center,
//        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        height: !isdot ? height : height / 2,
        width: !isdot ? width : width / 2,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.0)),
        child: !isdot
            ? Text('$_num',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12.0))
            : null);
  }
}
