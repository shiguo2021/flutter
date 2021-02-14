import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/detail_page.dart';
import './router_hander.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<dynamic>> params) {
      print('sg error==>route was not found');
    });

    router.define(
      detailsPage,
      handler: detailsHandler,
      transitionType: TransitionType.inFromRight,
    );
  }

/***
 * 第二种方法
 *      Application.router.navigateTo(context, "/detail/123/fff");
 */
  static void defineRoutes(FluroRouter router) {
    var detailHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
          DetailPage(
        id: params["id"]?.first,
        title: params['title']?.first,
      ),
    );
    router.define(
      '/detail/:id/:title',
      handler: detailHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
