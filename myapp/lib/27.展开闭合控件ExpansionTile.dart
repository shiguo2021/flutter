import 'package:flutter/material.dart';
import './widgets/expansion_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.dark(),
      home: ExpansionTileDemo(),
    );
  }
}
