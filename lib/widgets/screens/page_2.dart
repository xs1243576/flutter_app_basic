import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

import 'details/details_1.dart';

class Page2 extends StatefulWidget {
  @override
  Page2State createState() {
    return new Page2State();
  }
}

class Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  TextStyle searchText;
  Color searchBackground, searchIconColor, searchCursorColor;

  TextEditingController _searchTextController;
  FocusNode _searchFocusNode = new FocusNode();
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _searchTextController = TextEditingController();

    _animationController = new AnimationController(
      duration: new Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    _searchFocusNode.addListener(() {
      if (!_animationController.isAnimating) {
        _animationController.forward();
      }
    });
    _startSearch();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchFocusNode.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  void _startSearch() {
    _searchTextController.clear();
    _animationController.forward();
  }

  void _cancelSearch() {
    // if (widget.alwaysShowAppBar) {
    _searchTextController.clear();
    _searchFocusNode.unfocus();
    _animationController.reverse();
    // }
    // widget.onSearchPressed();
  }

  void _clearSearch() {
    _searchTextController.clear();
  }

  // final List<Color> colorItems;
  // final List<String> colorNameItems;
  bool _isSearching = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: CustomScrollView(
          semanticChildCount: presidents.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
//            trailing: trailingButtons,
//            middle: Text("Presidents"),
              largeTitle: Text("Presidents"),
            ),
            SliverPadding(
              // Top media padding consumed by CupertinoSliverNavigationBar.
              // Left/Right media padding consumed by Tab1RowItem.
              padding: MediaQuery.of(context)
                  .removePadding(
                removeTop: true,
                removeLeft: true,
                removeRight: true,
              )
                  .padding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final _president = presidents[index];
                    final String _name = _president[0];
                    final String _county = _president[1];
                    final String _date = _president[2];
                    // print("Index: $index / ${presidents?.length}");
                    return NativeListTile(
                      selected: false,
                      lastItem: index + 1 == presidents.length,
                      // avatar: Container(
                      //   height: 60.0,
                      //   width: 60.0,
                      //   decoration: BoxDecoration(
                      //     color: Colors.lightBlue,
                      //     borderRadius: BorderRadius.circular(8.0),
                      //   ),
                      // ),
                      leading: NativeIcon(
                        Icons.phone,
                        iosIcon: CupertinoIcons.phone_solid,
                      ),

                      title: Text(_name),
                      subtitle: Text(_county),
                      trailing: [
                        NativeText(_date, type: NativeTextTheme.detail),
                        // NativeIconButton(
                        //   icon: Icon(Icons.info),
                        //   iosIcon: Icon(CupertinoIcons.info),
                        //   onPressed: () {},
                        // ),
                      ],
                      ios: CupertinoListTileData(
                        hideLeadingIcon: true,
                        style: CupertinoCellStyle.subtitle,
                        accessory: CupertinoAccessory.none,
                        accessoryTap: () {},
                      ),
                      onTap: () {
//                        Navigator.push<dynamic>(
//                            context,
//                            NativeRoute<dynamic>(
//                                title: "Details",
//                                builder: (BuildContext context) =>
//                                    DetailsScreen()));
                        Navigator.of(context).push(CupertinoPageRoute<void>(
                          title: _name,
                          builder: (BuildContext context) => DetailsScreen(),
                        ));
                      },
                    );
                  },
                  childCount: presidents.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
//    return Scaffold(
//      appBar: NativeSearchAppBar(
//        title: const Text("Search Page"),
//        isSearching: _isSearching,
//        onSearchPressed: () {
//          setState(() {
//            _isSearching = !_isSearching;
//          });
//        },
//        onChanged: (String value) {
//          print(value);
//        },
//        // actions: <Widget>[
//        //   NativeIconButton(
//        //     icon: Icon(Icons.info_outline),
//        //     iosIcon: Icon(CupertinoIcons.info),
//        //   ),
//        // ],
//        ios: CupertinoNavigationBarData(
//          heroTag: "List",
//          transitionBetweenRoutes: false,
//        ),
//      ),
//      body: ListView.builder(
//        itemCount: presidents.length,
//        itemBuilder: (BuildContext context, int index) {
//          final _president = presidents[index];
//          final String _name = _president[0];
//          final String _county = _president[1];
//          final String _date = _president[2];
//          // print("Index: $index / ${presidents?.length}");
//          return NativeListTile(
//            selected: false,
//            lastItem: index + 1 == presidents.length,
//            // avatar: Container(
//            //   height: 60.0,
//            //   width: 60.0,
//            //   decoration: BoxDecoration(
//            //     color: Colors.lightBlue,
//            //     borderRadius: BorderRadius.circular(8.0),
//            //   ),
//            // ),
//            leading: NativeIcon(
//              Icons.phone,
//              iosIcon: CupertinoIcons.phone_solid,
//            ),
//
//            title: Text(_name),
//            subtitle: Text(_county),
//            trailing: [
//              NativeText(_date, type: NativeTextTheme.detail),
//              // NativeIconButton(
//              //   icon: Icon(Icons.info),
//              //   iosIcon: Icon(CupertinoIcons.info),
//              //   onPressed: () {},
//              // ),
//            ],
//            ios: CupertinoListTileData(
//              hideLeadingIcon: true,
//              style: CupertinoCellStyle.subtitle,
//              accessory: CupertinoAccessory.none,
//              accessoryTap: () {},
//            ),
//            onTap: () {
//              Navigator.push<dynamic>(
//                  context,
//                  NativeRoute<dynamic>(
//                      title: "Details",
//                      builder: (BuildContext context) => DetailsScreen()));
//            },
//          );
//        },
//      ),
//    );
  }
}

List<List<String>> presidents = <List<String>>[
  <String>['George Washington', 'Westmoreland County', ' 4/30/1789'],
  <String>['John Adams', 'Braintree', ' 3/4/1797'],
  <String>['Thomas Jefferson', 'Shadwell', ' 3/4/1801'],
  <String>['James Madison', 'Port Conway', ' 3/4/1809'],
  <String>['James Monroe', 'Monroe Hall', ' 3/4/1817'],
  <String>['Andrew Jackson', 'Waxhaws Region South/North', ' 3/4/1829'],
  <String>['John Quincy Adams', 'Braintree', ' 3/4/1825'],
  <String>['William Henry Harrison', 'Charles City County', ' 3/4/1841'],
  <String>['Martin Van Buren', 'Kinderhook New', ' 3/4/1837'],
  <String>['Zachary Taylor', 'Barboursville', ' 3/4/1849'],
  <String>['John Tyler', 'Charles City County', ' 4/4/1841'],
  <String>['James Buchanan', 'Cove Gap', ' 3/4/1857'],
  <String>['James K. Polk', 'Pineville North', ' 3/4/1845'],
  <String>['Millard Fillmore', 'Summerhill New', '7/9/1850'],
  <String>['Franklin Pierce', 'Hillsborough New', ' 3/4/1853'],
  <String>['Andrew Johnson', 'Raleigh North', ' 4/15/1865'],
  <String>['Abraham Lincoln', 'Sinking Spring', ' 3/4/1861'],
  <String>['Ulysses S. Grant', 'Point Pleasant', ' 3/4/1869'],
  <String>['Rutherford B. Hayes', 'Delaware', ' 3/4/1877'],
  <String>['Chester A. Arthur', 'Fairfield', ' 9/19/1881'],
  <String>['James A. Garfield', 'Moreland Hills', ' 3/4/1881'],
  <String>['Benjamin Harrison', 'North Bend', ' 3/4/1889'],
  <String>['Grover Cleveland', 'Caldwell New', ' 3/4/1885'],
  <String>['William McKinley', 'Niles', ' 3/4/1897'],
  <String>['Woodrow Wilson', 'Staunton', ' 3/4/1913'],
  <String>['William H. Taft', 'Cincinnati', ' 3/4/1909'],
  <String>['Theodore Roosevelt', 'New York City New', ' 9/14/1901'],
  <String>['Warren G. Harding', 'Blooming Grove', ' 3/4/1921'],
  <String>['Calvin Coolidge', 'Plymouth', '8/2/1923'],
  <String>['Herbert Hoover', 'West Branch', ' 3/4/1929'],
  <String>['Franklin D. Roosevelt', 'Hyde Park New', ' 3/4/1933'],
  <String>['Harry S. Truman', 'Lamar', ' 4/12/1945'],
  <String>['Dwight D. Eisenhower', 'Denison', ' 1/20/1953'],
  <String>['Lyndon B. Johnson', 'Stonewall', '11/22/1963'],
  <String>['Ronald Reagan', 'Tampico', ' 1/20/1981'],
  <String>['Richard Nixon', 'Yorba Linda', ' 1/20/1969'],
  <String>['Gerald Ford', 'Omaha', 'August 9/1974'],
  <String>['John F. Kennedy', 'Brookline', ' 1/20/1961'],
  <String>['George H. W. Bush', 'Milton', ' 1/20/1989'],
  <String>['Jimmy Carter', 'Plains', ' 1/20/1977'],
  <String>['George W. Bush', 'New Haven', ' 1/20, 2001'],
  <String>['Bill Clinton', 'Hope', ' 1/20/1993'],
  <String>['Barack Obama', 'Honolulu', ' 1/20/2009'],
  <String>['Donald J. Trump', 'New York City', ' 1/20/2017'],
];