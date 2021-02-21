import 'package:flutter/material.dart';

import 'package:flutter_daydart/flutter_daydart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './routes/application.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer _timer;
  int countDown = 5;

  @override
  void dispose() {
    print({
      'Splash': 'dispose',
    });

    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  void initState() {
    (() async {
      await Future.delayed(Duration(seconds: 1));
      _timer = Timer.periodic(Duration(seconds: 1), (t) {
        // print({
        //   'countDown': countDown,
        //   'is': countDown == 0,
        //   'tick': t.tick,
        //   'isActive': t.isActive,
        // });
        if (countDown == 0) {
          t.cancel();
          t = null;

          Application.router.navigateTo(context, '/guide');
        } else {
          setState(() {
            countDown -= 1;
          });
        }
      });
    })();
    super.initState();
  }

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

    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              child: Image.network(
                'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=119456383,1644967500&fm=26&gp=0.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(64),
              right: ScreenUtil().setWidth(10),
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  '倒计时:$countDown',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(70),
              child: InkWell(
                onTap: () {
                  _timer.cancel();
                  _timer = null;
                  Application.router.navigateTo(context, '/guide');
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                  child: Text(
                    '进入应用',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
