import 'package:flutter/material.dart';

void main() => runApp(MyApp(
    items: new List<String>.generate(
        5,
        (i) =>
            "item $i") //多种写法:List<String>() ,List<String>(1000) , [] , List(1000)
    ));

class MyApp extends StatelessWidget {
  final List<String> items;

//构造函数 , key自带的参数, 相当于构造函数,固定写法必须有
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              title: new Text('ListView widget 动态列表'),
            ),
            body: new ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return new ListTile(
                  title: new Text('${items[index]}'),
                );
              },
            )));
  }
}
