import 'package:flutter/material.dart';
import './widgets/search_bar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.light(),
      home: SearchBarDemo(),
    );
  }
}
