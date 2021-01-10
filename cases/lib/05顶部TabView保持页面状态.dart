import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: KeepAliveDemo(),
    );
  }
}


class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with 混入另一个类; 相当于多继承
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin{
  TabController _controller;

//重载
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3,vsync: this); //vsync 原自这个类SingleTickerProviderStateMixin
  }

//销毁
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: 
      AppBar(
        title: Text('保持页面状态'),
        elevation: 0.9,
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car),),
            Tab(icon: Icon(Icons.directions_transit),),
            Tab(icon: Icon(Icons.directions_bike),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          // Text('1111'),
          // Text('2222'),
          // Text('3333'),

          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
    );
  }
}