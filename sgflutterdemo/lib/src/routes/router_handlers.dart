import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:sgflutterdemo/src/page/book/TextFieldEventWidgetPage.dart';
import '../guide.dart';
import '../tabs_bottom.dart';
import '../page/login.dart';
import '../page/book/TextFieldWidgetPage.dart';
import '../page/book/TextFieldEventWidgetPage.dart';
import '../page/book/Keyboard_avoiderWidgetPage.dart';

var guideHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Guide();
  },
);

var tabsBottomHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TabsBottom();
  },
);

var loginHandler = Handler(
  handlerFunc: (context, params) => LoginPage(),
);

var textFieldWidgetPageHandler = Handler(
  handlerFunc: (context, params) => TextFieldWidgetPage(
    title: params['title']?.first,
  ),
);

var textFieldEventWidgetPageHandler = Handler(
  handlerFunc: (context, params) => TextFieldEventWidgetPage(
    title: params['title']?.first,
  ),
);

var keyboard_avoiderWidgetPageHandler = Handler(
  handlerFunc: (_, params) => Keyboard_avoiderWidgetPage(
    title: params['title']?.first,
  ),
);
