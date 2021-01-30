import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        allowFontScaling: false,
        child: Container(
          child: MaterialApp(
              title: '百姓生活+',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.pink, //主题色
              ),
              home: IndexPage()),
        ));
  }
}
