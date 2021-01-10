import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        
        body: Center(
          child: Text(
            '这一段文本,用于显示文本的对齐方式,....你看哦打了了,区别没有呢?',
            textAlign: TextAlign.left,//对其方式
            maxLines: 1, //显示多少行
            overflow: TextOverflow.ellipsis,//超出部分用省略号代替 (fade:渐变)
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 255,125, 125),
              decoration: TextDecoration.underline,//下划线
              decorationStyle: TextDecorationStyle.dotted //虚线
            ),
          ),
        ),
      ),
    );
  }
}

