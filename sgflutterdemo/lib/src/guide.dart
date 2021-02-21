import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './routes/application.dart';

class Guide extends StatelessWidget {
  final list = [
    'lib/src/assets/icon_install1.jpg',
    'lib/src/assets/icon_install2.jpg',
    'lib/src/assets/icon_install3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (index == list.length - 1) {
                        Application.router.navigateTo(context, 'login');
                      }
                    },
                    child: Image.asset(
                      list[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                loop: false,
                itemCount: list.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
