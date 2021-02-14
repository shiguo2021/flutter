import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id']?.first;
    String title = params['title']?.first;
    print({
      'params': params,
    });
    return DetailPage(
      id: goodsId,
      title: title,
    );
  },
);
