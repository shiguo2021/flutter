import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Text widget',
      home: Scaffold(
        body: Center(
            child: Container(
          child: new Text('学习Container组件相当于html',
              style: TextStyle(fontSize: 40.0, color: Colors.red)),
          alignment: Alignment.topLeft,
          width: 500.0,
          height: 400.0,
          padding: const EdgeInsets.fromLTRB(
              10.0, 30.0, 0.0, 0.0), //all:上下左右都是10 ; fromLTRB:左上右下的边距设置
          margin: const EdgeInsets.all(10),

//背景颜色线性渐变  , 这个属性和color冲突
          decoration: new BoxDecoration(
              //渐变背景
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.purple]),
              border: Border.all(width: 2.0, color: Colors.red)),
        )),
      ),
    );
  }
}
