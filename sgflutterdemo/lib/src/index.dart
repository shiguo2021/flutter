import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgflutterdemo/src/splash.dart';
/**路由 */
import 'package:fluro/fluro.dart';
import './routes/application.dart';
import './routes/routes.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**路由配置 */
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    var screen = ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      builder: () => MaterialApp(
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Splash(),
        ),
      ),
    );

    return screen;
  }
}
