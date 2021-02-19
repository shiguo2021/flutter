import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:sgflutterdemo/src/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print({
    //   'defaultSize': ScreenUtil.defaultSize,
    //   'pixelRatio': ScreenUtil().pixelRatio,
    //   'screenWidth': ScreenUtil().screenWidth,
    //   'screenHeight': ScreenUtil().screenHeight,
    //   'bottomBarHeight': ScreenUtil().bottomBarHeight,
    //   'textScaleFactor': ScreenUtil().textScaleFactor,
    //   'scaleWidth': ScreenUtil().scaleWidth,
    //   'scaleHeight': ScreenUtil().scaleHeight,
    //   '屏幕宽度的0.2倍': 0.2,
    // });
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //       // body: Splash(),
    //       ),
    // );

    return ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Splash(),
        ),
      ),
    );
  }
}
