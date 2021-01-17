import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        body: Center(
            child: Container(
          child: new Text('学习Container组件,相当于html',
              style: TextStyle(fontSize: 40.0, color: Colors.red)),
          alignment: Alignment.bottomLeft,
          width: 500.0,
          height: 400.0,
          color: Colors.lightBlue,
        )),
      ),
    );
  }
}
