import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('垂直方向布局'),
        ),
        body: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,//左对齐
          mainAxisAlignment: MainAxisAlignment.center,// 主轴
          children: <Widget>[
            Text('I am JSPang'),
           Expanded( child:Text('My website is jspang.com')),//Expanded灵活布局,相当余flex,看主轴方向
            Text('I love coding')
          ],
        ),
        )
      ),
    );
  }
}
