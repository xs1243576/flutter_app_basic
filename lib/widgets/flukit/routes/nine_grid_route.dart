import '../utils/utils.dart';
import 'package:flutter/material.dart';

import 'nine_grid/nine_grid_page.dart';

class NineGridRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("NineGridView & DragSortView"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Utils.pushPage(context, NineGridPage());
          },
        ),
      ],
    );
  }
}
