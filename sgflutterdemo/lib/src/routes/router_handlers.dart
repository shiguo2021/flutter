import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import '../guide.dart';
import '../tabs_bottom.dart';
import '../page/login.dart';

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
  handlerFunc: (context, parameters) => LoginPage(),
);
