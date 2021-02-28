import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handlers.dart';
import 'error.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('route was not found !!!');
      return ErrerPage();
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

    router.define(
      '/TextFieldEventWidgetPage',
      handler: textFieldEventWidgetPageHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/Keyboard_avoiderWidgetPage',
      handler: keyboard_avoiderWidgetPageHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
