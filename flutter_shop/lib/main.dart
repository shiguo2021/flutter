import 'package:flutter/material.dart';

import './pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fluro/fluro.dart';
import "./routers/application.dart";
import "./routers/routes.dart";
import "package:flutter_shop/setting/provider_store.dart";

void main() {
  runApp(ProviderStore(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    /*第一种路由配置方法 */
    Routes.configureRoutes(router);
    /**第二种路由配置方法 */
    // Routes.defineRoutes(router);
    Application.router = router;

    return ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      child: Container(
        child: MaterialApp(
          onGenerateRoute: Application.router.generator,
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
      ),
    );
  }
}
