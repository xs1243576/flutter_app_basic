import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

Future<dynamic> showAlertPopup(BuildContext context,
    {String title, String detail}) async {
  return showNativeDialog(
      context: context,
      child: NativeDialog(
        title: Text(title),
        content: Text(detail),
        actions: <NativeDialogAction>[
          NativeDialogAction(
              text: Text('Delete'),
              isDestructive: true,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(true);
              }),
          NativeDialogAction(
              text: Text('Ok'),
              isDestructive: false,
              removeInActionSheet: true,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              }),
        ],
        ios: CupertinoDialogData(
          showActionSheet: false,
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
      ));
}