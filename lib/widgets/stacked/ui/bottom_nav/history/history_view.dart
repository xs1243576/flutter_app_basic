import 'package:flutter/material.dart';
import '../../../app/locator.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
          body: Center(
              child: model.isBusy
                  ? CircularProgressIndicator()
                  : Text(model.data.toString()))),
      viewModelBuilder: () => locator<HistoryViewModel>(),
    );
  }
}
