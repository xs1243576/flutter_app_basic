import 'package:flutter/material.dart';
import '../../datamodels/human.dart';
import '../dumb_widgets/duplicate_name_widget.dart';
import '../dumb_widgets/full_name_widget.dart';
import 'package:provider/provider.dart';

class HomeViewProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: Human(name: 'Dane', surname: 'Mackier'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[FullNameWidget(), DuplicateNameWidget()],
        ),
      ),
    );
  }
}
