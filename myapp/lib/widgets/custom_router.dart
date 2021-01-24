import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  CustomRoute(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              //1、渐隐渐显的效果
              // return FadeTransition(
              //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //       parent: animation1, curve: Curves.fastOutSlowIn)),
              //   child: child,
              // );

              //2.缩放的动画效果
              // return ScaleTransition(
              //   scale:Tween(begin: 0.0,end:1.0).animate(CurvedAnimation(
              //     parent:animation1,
              //     curve:Curves.fastOutSlowIn,// 这个属性表示选择动画曲线,快出慢进
              //   )),
              //   child: child,
              // );

              //3.旋转+缩放的效果
              // return RotationTransition(
              //   turns: Tween(begin: 0.0,end:1.0).animate(CurvedAnimation(
              //     parent:animation1,
              //     curve: Curves.fastOutSlowIn,
              //   )),
              //   child: ScaleTransition(
              //     scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
              //       parent:animation1,
              //       curve: Curves.fastOutSlowIn,
              //     )),
              //     child: child,
              //   ),
              // );

              //4.0左进左出
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                  parent: animation1,
                  // curve: Curves.elasticIn,
                  // curve: Curves.bounceOut
                  //  curve: Curves.fastOutSlowIn,
                  curve: Curves.ease,
                )),
                child: child,
              );
            });
}
