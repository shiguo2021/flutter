import 'package:flutter/material.dart';
import './widgets/bottom_appBar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //自定义主题
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: BottomAppBarDemo()),
    );
  }
}
