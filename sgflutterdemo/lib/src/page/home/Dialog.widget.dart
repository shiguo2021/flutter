import 'package:flutter/material.dart';
import '../base/base.controller.dart';

class Dialog_widget extends Base_controller {
  Dialog_widget({title}) : super(title: title);

  List list = ["AlertDialog"];

  @override
  Widget initViews(BuildContext context) {
    return Wrap(
      children: list
          .map(
            (e) => RaisedButton(
              onPressed: () {
                switch (e) {
                  case "AlertDialog":
                    AlertDialog(context);
                    break;
                }
              },
              child: Text(e),
            ),
          )
          .toList(),
    );
  }

  AlertDialog(context) {
    print('AlertDialog');
  }
}
