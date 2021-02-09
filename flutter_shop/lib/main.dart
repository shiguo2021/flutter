import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/category_child.dart';
import './pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import "./provider/counter.dart";
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        // Provider<Counter>(create: (_) => Counter()),
        ChangeNotifierProvider.value(value: Counter()),
        ChangeNotifierProvider.value(value: CategoryChild())
      ],
      child: MyApp(),
    ),
  );
}

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
            home: IndexPage(),

            localizationsDelegates: [
              // GlobalEasyRefreshLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            //国际化
            supportedLocales: [
              Locale('zh', 'CN'),
            ],
          ),
        ));
  }
}
