import 'package:flutter/material.dart';
import '../base/base.controller.dart';

class Dialog_widget extends Base_controller {
  Dialog_widget({title}) : super(title: title);

  List list = ["AlertDialog", "SimpleDialog"];

  @override
  Widget initViews(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: list
          .map(
            (e) => RaisedButton(
              onPressed: () {
                switch (e) {
                  case "AlertDialog":
                    _AlertDialog(context);
                    break;
                  case "SimpleDialog":
                    _SimpleDialog(context);
                    break;
                }
              },
              child: Text(e),
            ),
          )
          .toList(),
    );
  }

  void _AlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('标题'),
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 100,
            color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1'),
                Text('2'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确认'),
            )
          ],
        );
      },
    ).then((value) {
      print(value);
    });
  }

  _SimpleDialog(BuildContext context) {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          backgroundColor: Colors.red,
          title: new Text('选择'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
}
