import 'package:flutter/material.dart';
// import './20.底部导航栏.dart';
// import './21.底部导航栏.不规则.dart';
// import './22.路由转场动画.dart';
// import './23.毛玻璃效果.dart';
// import './24.保持页面状态（segment）.dart';
// import '25.不一样的搜索框.dart';
// import '26.Warp流式布局.dart';
// import '27.展开闭合控件ExpansionTile.dart';

// import '28.展开闭合动态控制ExpansionPanel.dart';
// import '29.贝塞尔曲线切割.dart';
// import '30.启动图动画.dart';
// import '31.仿ios侧滑组件.dart';
// import '32.TipView.轻量级提示.dart';
import '33.拖拽View.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: MyApp(),
    // );

    // return MyApp();// 拖拽视图要放在MaterialApp里面

    return MaterialApp(
      home: MyApp(),
    );
  }
}
