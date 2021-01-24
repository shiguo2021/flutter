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
              'https://i0.hdslb.com/bfs/face/c81969907b5c286b50d02400e7d54b13595f09bb.jpg@68w_68h.jpg'),
          radius: 100.0,
        ),
        new Positioned(
          //三个以上的层叠用这个组件
          top: 10.0,
          left: 10.0,
          child: new Text('JSPang.com'),
        ),
        new Positioned(
          bottom: 10.0,
          right: 10.0,
          child: new Text('技术胖'),
        )
      ],
    );
    return MaterialApp(
      title: '层叠定位布局',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('层叠定位布局'),
          ),
          body: Center(
            child: stack,
          )),
    );
  }
}
