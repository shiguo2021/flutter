import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handlers.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('route was not found !!!');
      return;
    });

    router.define(
      '/guide',
      handler: guideHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/tabs_bottom',
      handler: tabsBottomHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/login',
      handler: loginHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/TextFieldWidgetPage',
      handler: textFieldWidgetPageHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
