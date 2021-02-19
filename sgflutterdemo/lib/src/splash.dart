import 'package:flutter/material.dart';

import 'package:flutter_daydart/flutter_daydart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  // "http://via.placeholder.com/350x150",
                  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=119456383,1644967500&fm=26&gp=0.jpg',
                  // "https://raw.githubusercontent.com/sgmorals/res/main/icons/jierihaibao/${Uri.encodeComponent('初一')}.png",
                  // Uri.encodeComponent(
                  //     'https://raw.githubusercontent.com/sgmorals/res/main/icons/jierihaibao/初一.png'),
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(),
            ),
          )

          // Container(
          //   color: Colors.orange,
          //   alignment: Alignment.bottomCenter,
          //   padding: EdgeInsets.only(bottom: 100),
          //   child: InkWell(
          //     onTap: () {
          //       print('123');
          //     },
          //     child: Text(
          //       '进入应用',
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
