import 'package:flutter/material.dart';
import 'tool_tip.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home:ToolTipDemo()
    );
  }
}
