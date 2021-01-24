import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar', //这个是框架标题
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}
