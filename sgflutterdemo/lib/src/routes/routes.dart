import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:sgflutterdemo/src/page/book/GridView.widget.dart';
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
      handler: guide_Handler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/tabs_bottom',
      handler: tabsBottom_Handler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/login',
      handler: login_Handler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/TextField_widget',
      handler: TextField_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/TextField_event_widget',
      handler: TextField_event_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/Keyboard_avoider_widget',
      handler: Keyboard_avoider_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      '/CustomScrollView_widget',
      handler: CustomScrollView_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/GridView_widget',
      handler: GridView_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/Dialog_widget',
      handler: Dialog_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      '/CupertinoPicker_widget',
      handler: CupertinoPicker_widget_Handler,
      transitionType: TransitionType.inFromRight,
    );

    router.define('/Button_widget',
        handler: Button_widget_Handler,
        transitionType: TransitionType.inFromRight);
  }
}
