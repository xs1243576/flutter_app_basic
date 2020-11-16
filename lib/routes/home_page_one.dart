import 'package:flutter/material.dart';
import 'empty_page.dart';

class HomePageOne extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowMaterialGrid: true,
      //  还有几个方便调试的选项，debugShowMaterialGrid：打开网格调试
//      showPerformanceOverlay: true,
      //  showPerformanceOverlay：打开性能检测
      debugShowCheckedModeBanner: true,
      //右上角有一个DEBUG的标识，这是系统在debug模式下默认显示的，不显示的设置如下：

      title: 'HomePageOne',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      onGenerateTitle: (context) {
        var local = Localizations.localeOf(context);
        if (local.languageCode == 'zh') {
          return 'HomePageOne_zh';
        }
        return 'HomePageOne';
      },
//      theme: ThemeData(
//          primaryColor: Colors.red
//      ),
//      darkTheme: ThemeData(
//          primaryColor: Colors.red
//      ),
//      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: Colors.orange,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.red, fontSize: 24),
          )),
      home: ScaffoldRoute(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) {
        print('onGenerateRoute:$routeSettings');
        if (routeSettings.name == 'icon') {
          return MaterialPageRoute(builder: (context) {
            return EmptyPage();
          });
        }
      },
      onUnknownRoute: (RouteSettings routeSettings) {
        print('onUnknownRoute:$routeSettings');
        return MaterialPageRoute(builder: (context) {
          return EmptyPage();
        });
      },
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  ScaffoldRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

// 缓存tabbar pageview对应的页面
// , AutomaticKeepAliveClientMixin

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      // switch (_tabController.index) {
      //   case 1:
      //     print('object1');
      //   case 2:
      //     print('object2');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        centerTitle: true,
        // 标题居中
        title: Text("App Name"),
        //这里设置  可以通过设置Scaffold的背景色来达到设置总体背景色的目的，示例代码如下：
//        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        bottom: TabBar(
            //生成Tab菜单
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            labelStyle: TextStyle(height: 1, fontSize: 17),
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      drawer: new MyDrawerHomeOne(), //抽屉
      body: TabBarView(
        controller: _tabController,
//        physics: NeverScrollableScrollPhysics(),
        physics: AlwaysScrollableScrollPhysics(),
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 2),
          );
        }).toList(),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   // 底部导航
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.business), title: Text('Business')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.school), title: Text('School')),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyDrawerHomeOne extends StatelessWidget {
  const MyDrawerHomeOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
