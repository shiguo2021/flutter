import 'package:flutter/material.dart';
import '../model/CategoryModel.dart';
import "../service/service_methd.dart";
import "dart:convert";
import "package:flutter_screenutil/flutter_screenutil.dart";

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
      ),
      body: Container(
        child: Row(
          children: [
            CategoryNavLeft(),
          ],
        ),
      ),
    );
  }
}

class CategoryNavLeft extends StatefulWidget {
  CategoryNavLeft({Key key}) : super(key: key);

  @override
  _CategoryNavLeftState createState() => _CategoryNavLeftState();
}

class _CategoryNavLeftState extends State<CategoryNavLeft> {
  List<CategoryModel> list = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    getRequest('categorys').then((value) {
      print(value);
      CategoryModels categoryModels = CategoryModels.fromJson(value);
      print(categoryModels.data);
      setState(() {
        list = categoryModels.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) => buildItem(index),
        itemCount: list.length,
      ),
    );
  }

  Widget buildItem(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(44),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(
          list[index].name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
