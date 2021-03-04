import 'package:flutter/material.dart';
import 'package:sgflutterdemo/src/index.dart';
import '../base/base.controller.dart';
import 'dart:math';

class Dialog_widget extends Base_controller {
  Dialog_widget({title}) : super(title: title);

  List list = ["AlertDialog", "SimpleDialog", "showModalBottomSheet"];

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
                  case "showModalBottomSheet":
                    _showModalBottomSheet(
                        context: context, seed: Random().nextInt(10));
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
                Text('0'),
                Text('1'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop(0);
              },
              child: Text('取消'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, 1);
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

  _showModalBottomSheet({BuildContext context, int seed}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, //设置为 true 后，底部弹框的最大高度可以占满全屏。
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return Container(
          height: ScreenUtil().setHeight(300),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('取消'),
                  ),
                  TextButton(onPressed: () {}, child: Text('确定')),
                ],
              ),
              Text('$seed',
                  style: TextStyle(fontSize: 16, color: Colors.orangeAccent)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.red,
                  child: ListView.builder(
                    itemCount: seed,
                    itemBuilder: (context, index) => Text('$index'),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
