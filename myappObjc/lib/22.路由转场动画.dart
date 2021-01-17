import 'package:flutter/material.dart';
import './widgets/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FirstPage(),
    );
  }
}
