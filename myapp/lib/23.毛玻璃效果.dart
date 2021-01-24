import 'package:flutter/material.dart';
import './widgets/frosted_glass_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('毛玻璃效果',
                style: TextStyle(
                  color: Colors.white,
                ))),
        body: FrostedGlassDemo(),
      ),
    );
  }
}
