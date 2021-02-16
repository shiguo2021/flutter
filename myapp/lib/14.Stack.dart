import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const FractionalOffset(1, 1), //0~1,中心点控制
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage(
            'https://i0.hdslb.com/bfs/face/c81969907b5c286b50d02400e7d54b13595f09bb.jpg@68w_68h.jpg',
          ),
          radius: 100.0,
        ),
        ClipOval(
          child: Image.network(
            'https://i0.hdslb.com/bfs/face/c81969907b5c286b50d02400e7d54b13595f09bb.jpg@68w_68h.jpg',
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlue,
          ),
          padding: EdgeInsets.all(5.0),
          child: Text('JS pang 技术胖'),
        )
      ],
    );
    return MaterialApp(
      title: 'Row Widget Demo',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('层叠方向布局'),
          ),
          body: Center(
            child: stack,
          )),
    );
  }
}
