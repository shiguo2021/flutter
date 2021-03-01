import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgflutterdemo/src/splash.dart';
/**路由 */
import 'package:fluro/fluro.dart';
import 'routes/application.dart';
import 'routes/routes.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**路由配置 */
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    final screen = ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      builder: () => MaterialApp(
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          body: Splash(),
        ),
      ),
    );

    /**全局设备点击空白区域收起键盘 */
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: screen,
    );

    // return screen;
  }
}
