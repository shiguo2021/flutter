import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/CategoryModel.dart';
import "../service/service_methd.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import 'package:provider/provider.dart';
import '../provider/category_child.dart';

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
            Column(
              children: [
                RightCategoryNav(),
              ],
            ),
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
  int clickIndex = 0;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    getRequest('categorys').then((value) {
      print(value);
      CategoryModels categoryModels = CategoryModels.fromJson(value);
      // print(categoryModels.data);
      setState(() {
        list = categoryModels.data;
      });

      context.read<CategoryChild>().setChildren(list[0].children);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100),
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

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          clickIndex = index;
        });

        context.read<CategoryChild>().setChildren(list[index].children);
      },
      child: Container(
        height: ScreenUtil().setHeight(44),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: index == clickIndex ? Colors.black38 : Colors.white,
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

class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav>
    with AutomaticKeepAliveClientMixin {
  // List list = ['贵州茅台', '五粮液', '汾酒', '洋河', '北京二锅头', '青梅酒', '古井贡酒', '拉菲'];

  int clickIndex = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(44),
      width: ScreenUtil().setWidth(314),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildItem(index);
        },
        itemCount: context.watch<CategoryChild>().categoryChildren.length,
      ),
    );
  }

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          clickIndex = index;
        });
      },
      child: Container(
        // color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          context.watch<CategoryChild>().categoryChildren[index].name,
          style: TextStyle(
            color: clickIndex == index ? Colors.red : Colors.black26,
          ),
        ),
      ),
    );
  }
}
