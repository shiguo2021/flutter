import 'package:flutter/material.dart';
import '../model/CategoryBigModel.dart';
import "../service/service_methd.dart";
import "dart:convert";

class CatgoryPage extends StatefulWidget {
  CatgoryPage({Key key}) : super(key: key);

  @override
  _CatgoryPageState createState() => _CatgoryPageState();
}

class _CatgoryPageState extends State<CatgoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    (() async {
      await getRequest('category').then((val) {
        print(val);
        // var valString = json.encode(val);
        // print(valString);
        // var data = json.decode(valString);
        // print(data['data']);

        List ls = new List<Map<String, dynamic>>.from(val['data']);
        print(ls);
        CategoryBigListModel list = CategoryBigListModel.fromJson(val['data']);
        list.data.forEach((element) {
          print(element.mallCategoryName);
        });
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('分类'),
    );
  }
}
