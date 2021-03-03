import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:sgflutterdemo/src/page/book/TextField.Event.widget.dart';
import '../guide.dart';
import '../tabs_bottom.dart';
import '../page/login.dart';
import '../page/book/TextField.widget.dart';
import '../page/book/TextField.Event.widget.dart';
import '../page/book/Keyboard_avoider.widget.dart';
import '../page/book/CustomScrollView.widget.dart';
import '../page/book/GridView.widget.dart';
import '../page/home/Dialog.widget.dart';

var guide_Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Guide();
  },
);

var tabsBottom_Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TabsBottom();
  },
);

var login_Handler = Handler(
  handlerFunc: (context, params) => LoginPage(),
);

var TextField_widget_Handler = Handler(
  handlerFunc: (context, params) => TextField_widget(
    title: params['title']?.first,
  ),
);

var TextField_event_widget_Handler = Handler(
  handlerFunc: (context, params) => TextField_event_widget(
    title: params['title']?.first,
  ),
);

var Keyboard_avoider_widget_Handler = Handler(
  handlerFunc: (_, params) => Keyboard_avoider_widget(
    title: params['title']?.first,
  ),
);

var CustomScrollView_widget_Handler = Handler(
  handlerFunc: (_, params) => CustomScrollView_widget(
    title: params['title']?.first,
  ),
);

var GridView_widget_Handler = Handler(
  handlerFunc: (_, params) => GridView_widget(
    title: params['title']?.first,
  ),
);

final Dialog_widget_Handler = Handler(
  handlerFunc: (_, params) => Dialog_widget(
    title: params['title']?.first,
  ),
);
