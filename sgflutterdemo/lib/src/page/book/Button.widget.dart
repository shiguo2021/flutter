import "package:flutter/material.dart";
import 'package:sgflutterdemo/src/page/base/base.controller.dart';

class Button_widget extends Base_controller {
  Button_widget({title}) : super(title: title);

  // TextButton/IconButton/FlatButton/RaisedButton/InkWell
  @override
  Widget initViews(BuildContext context) {
    return Wrap(
      children: [
        TextButton(onPressed: () {}, child: Text('TextButton')),
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        FlatButton(onPressed: () {}, child: Text('FlatButton')),
        RaisedButton(onPressed: () {}, child: Text('RaisedButton')),
        CloseButton(onPressed: () {}),
        BackButton(onPressed: () {}),
        InkWell(onTap: () {}, child: Text('InkWell')),
      ],
    );
  }
}
