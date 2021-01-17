import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //约束盒子组件,添加额外的约束条件child上
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://imgsa.baidu.com/forum/pic/item/1e335336acaf2edd05d03fe0821001e939019354.jpg'),
          ),

          Center(
              //可裁切的矩形
              child: ClipRect(
            //背景过滤器
            child: BackdropFilter(
              //图片过滤器
              filter:
                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), //模糊  引入来源dart：ui
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 500.0,
                  height: 700.0,
                  decoration:
                      BoxDecoration(color: Colors.grey.shade200), //盒子修饰器
                  child: Center(
                    child: Text('JSPang',
                        style: Theme.of(context).textTheme.button),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
