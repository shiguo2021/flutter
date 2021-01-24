import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Text widget',
      home: Scaffold(
        body: Center(
            child: Container(
          child: new Image.network(
              'https://i0.hdslb.com/bfs/sycp/creative_img/201910/ee20fc166769cf91bd33286cc5037f4c.jpg',
              // fit: BoxFit.fitWidth, //宽方向充满容器
              scale: 2.0,
              //颜色混合
              // color: Colors.greenAccent,
              // colorBlendMode: BlendMode.modulate,

              //重复
              repeat: ImageRepeat.repeatY // repeat:以中心重复 ,repeatY:以y方向重复
              ),
          width: 300.0,
          height: 200.0,
          color: Colors.lightBlue,
        )),
      ),
    );
  }
}
