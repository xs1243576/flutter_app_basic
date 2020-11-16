import 'package:flutter/material.dart';
import 'package:platform_aware/platform_aware.dart';

//为自动适应当前平台而包装的Flutter组件，不需要对iOS和Android进行代码更改。所有小部件都依赖于Theme.of(context).platform来确定当前活动平台的平台。你可以使用Flutter Inspector动态地更改平台。

class PlatformAwareApp extends StatefulWidget {
  @override
  State createState() => new PlatformAwareAppState();
}

class PlatformAwareAppState extends State<PlatformAwareApp> {
  TargetPlatform targetPlatform = TargetPlatform.android;

  void _togglePlatform() =>
      setState(() => targetPlatform = (targetPlatform == TargetPlatform.android
          ? TargetPlatform.iOS
          : TargetPlatform.android));

  @override
  Widget build(BuildContext context) => new MaterialApp(
    title: 'Flutter Demo',
    initialRoute: '/',
    theme: new ThemeData.light().copyWith(platform: targetPlatform),
    routes: {
      '/': (BuildContext context) =>
      new MainMenu(togglePlatform: _togglePlatform),
      '/flatbutton': (BuildContext context) =>
      new FlatButtonDemo(togglePlatform: _togglePlatform),
      '/raisedbutton': (BuildContext context) =>
      new RaisedButtonDemo(togglePlatform: _togglePlatform),
      '/dialog': (BuildContext context) =>
      new AlertDialogDemo(togglePlatform: _togglePlatform),
      '/card': (BuildContext context) =>
      new CardDemo(togglePlatform: _togglePlatform),
      '/checkbox': (BuildContext context) =>
      new CheckboxDemo(togglePlatform: _togglePlatform),
      '/picker': (BuildContext context) =>
      new PickerDemo(togglePlatform: _togglePlatform),
      '/iconbutton': (BuildContext context) =>
      new IconButtonDemo(togglePlatform: _togglePlatform),
      '/tabs': (BuildContext context) =>
      new TabsDemo(togglePlatform: _togglePlatform),
    },
  );
}

class TabsDemo extends StatelessWidget {
  final VoidCallback togglePlatform;

  TabsDemo({@required this.togglePlatform});

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Tabs'),
    tabs: <PlatformAwareTabItem>[
      new PlatformAwareTabItem(text: 'Left', icon: Icons.arrow_left),
      new PlatformAwareTabItem(text: 'Right', icon: Icons.arrow_right),
    ],
    tabViewBuilder: (BuildContext context, int tabIndex) => new Center(
      child: new Text(
        (tabIndex == 0) ? 'Left tab!' : 'Right tab!',
        style: Theme.of(context).textTheme.display1,
      ),
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: togglePlatform,
      ),
    ],
  );
}

class CardDemo extends StatelessWidget {
  final VoidCallback togglePlatform;

  CardDemo({@required this.togglePlatform});

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Card'),
    body: new ListView(
        children: new Iterable.generate(
            5,
                (_) => new Row(
              children: <Widget>[
                new Expanded(
                    child: new PlatformAwareCard(
                      title: new Text(
                        "Hello",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      content: new Container(
                          padding: const EdgeInsets.all(4.0),
                          child: new Column(
                            children: <Widget>[
                              new Text("Place any content here"),
                              new Text("or here"),
                              new Text("or here"),
                            ],
                          )),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )).toList()),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: togglePlatform,
      ),
    ],
  );
}

class CheckboxDemo extends StatefulWidget {
  final VoidCallback togglePlatform;

  CheckboxDemo({@required this.togglePlatform});

  @override
  State createState() => new CheckboxDemoState();
}

class CheckboxDemoState extends State<CheckboxDemo> {
  Map<int, bool> checkState = new Map.fromIterable(
      new Iterable<int>.generate(30),
      value: (key) => key % 2 > 0);

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Checkbox'),
    body: new ListView(
        children: checkState.entries
            .map((MapEntry<int, bool> entry) => new PlatformAwareListTile(
          title: new Text('Checkbox ${entry.key}',
              style: Theme.of(context).textTheme.subhead),
          onTap: () =>
              setState(() => checkState[entry.key] = !entry.value),
          trailing: new PlatformAwareCheckbox(
            onChanged: (bool newChecked) =>
                setState(() => checkState[entry.key] = newChecked),
            value: entry.value,
          ),
        ))
            .toList()),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: widget.togglePlatform,
      ),
    ],
  );
}

class PickerDemo extends StatefulWidget {
  final VoidCallback togglePlatform;

  PickerDemo({@required this.togglePlatform});

  @override
  State createState() => new PickerDemoState();
}

class PickerDemoState extends State<PickerDemo> {
  int selectedIndex = 0;
  final List<Color> items = <Color>[
    Colors.deepOrange,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.lightGreenAccent
  ];

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Picker'),
    body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new PlatformAwareDecoration(title: 'Picker demo'),
            new PlatformAwarePicker<Color>(
              initialItemIndex: selectedIndex,
              items: items,
              onChanged: (Color selectedColor) =>
                  setState(() => selectedIndex = items.indexOf(selectedColor)),
              itemWidgetBuilder: (BuildContext context, Color item) => new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Container(
                    width: 15.0,
                    height: 15.0,
                    color: item,
                    margin: const EdgeInsets.only(right: 10.0),
                  ),
                  new Text("Color #${items.indexOf(item)}"),
                ],
              ),
            ),
          ],
        )),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: widget.togglePlatform,
      ),
    ],
  );
}

class TogglePlatformAppBarButton extends StatelessWidget {
  final VoidCallback togglePlatform;

  TogglePlatformAppBarButton({@required this.togglePlatform});

  @override
  Widget build(BuildContext context) => new Container(
    child: new PlatformAwareIconButton(
        onPressed: togglePlatform,
        tooltip: 'Switch platform',
        icon: new Icon(Theme.of(context).platform != TargetPlatform.android
            ? Icons.android
            : Icons.smartphone)),
    padding: const EdgeInsets.only(right: 20.0),
  );
}

class MainMenu extends StatelessWidget {
  final VoidCallback togglePlatform;

  MainMenu({@required this.togglePlatform});

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('platforn_aware demo'),
    body: new ListView(
      children: ListTile
          .divideTiles(
          tiles: <String>[
            'Flatbutton',
            'Raisedbutton',
            'Iconbutton',
            'Dialog',
            'Card',
            'Checkbox',
            'Picker',
            'Tabs'
          ]
              .map((String title) => new PlatformAwareListTile(
            title: new Text(
              title,
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () => Navigator
                .of(context)
                .pushNamed('/${title.toLowerCase()}'),
          ))
              .toList(),
          color: Theme.of(context).dividerColor)
          .toList(growable: false),
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: togglePlatform,
      ),
    ],
  );
}

class RaisedButtonDemoState extends State<RaisedButtonDemo> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Button'),
    body: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              counter.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            new PlatformAwareRaisedButton(
              child: new Text("Click me"),
              onPressed: () => setState(() => ++counter),
            )
          ],
        )
      ],
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: widget.togglePlatform,
      ),
    ],
  );
}

class RaisedButtonDemo extends StatefulWidget {
  final VoidCallback togglePlatform;

  RaisedButtonDemo({@required this.togglePlatform});

  @override
  State createState() => new RaisedButtonDemoState();
}

class FlatButtonDemoState extends State<FlatButtonDemo> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Button'),
    body: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              counter.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            new PlatformAwareFlatButton(
              child: new Text("Click me"),
              onPressed: () => setState(() => ++counter),
            )
          ],
        )
      ],
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: widget.togglePlatform,
      ),
    ],
  );
}

class FlatButtonDemo extends StatefulWidget {
  final VoidCallback togglePlatform;

  FlatButtonDemo({@required this.togglePlatform});

  @override
  State createState() => new FlatButtonDemoState();
}

class IconButtonDemoState extends State<IconButtonDemo> {
  final List<Color> colors = <Color>[
    Colors.redAccent,
    Colors.blueAccent,
    Colors.deepOrange,
    Colors.green,
    Colors.purple
  ];
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('IconButton'),
    body: new Center(
      child: new PlatformAwareIconButton(
        iconSize: 100.0,
        icon: new Icon(
          Icons.settings,
          color: colors.elementAt(selectedColorIndex),
        ),
        onPressed: () => setState(() =>
        selectedColorIndex = (selectedColorIndex + 1) % colors.length),
        tooltip: 'Settings',
      ),
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: widget.togglePlatform,
      ),
    ],
  );
}

class IconButtonDemo extends StatefulWidget {
  final VoidCallback togglePlatform;

  IconButtonDemo({@required this.togglePlatform});

  @override
  State createState() => new IconButtonDemoState();
}

class AlertDialogDemo extends StatelessWidget {
  final VoidCallback togglePlatform;

  AlertDialogDemo({@required this.togglePlatform});

  @override
  Widget build(BuildContext context) => new PlatformAwareScaffold(
    title: new Text('Dialog'),
    body: new Center(
      child: new PlatformAwareRaisedButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
              new PlatformAwareAlertDialog(
                title: new Text('Demo dialog'),
                content: new Row(
                  children: <Widget>[
                    new Text('Some content'),
                    new PlatformAwareIcon(Icons.track_changes)
                  ],
                ),
                actions: <Widget>[
                  new PlatformAwareFlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: new Row(
                        children: <Widget>[
                          new Text("Done"),
                          new Icon(Icons.check)
                        ],
                      )),
                  new PlatformAwareFlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: new Row(
                        children: <Widget>[
                          new Text("Close"),
                          new Icon(Icons.close)
                        ],
                      ))
                ],
              )),
          child: new Text("Show dialog")),
    ),
    actions: <Widget>[
      new TogglePlatformAppBarButton(
        togglePlatform: togglePlatform,
      ),
    ],
  );
}










