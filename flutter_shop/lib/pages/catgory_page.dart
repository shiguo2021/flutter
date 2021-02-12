import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/model/HotGoodsModel.dart';

import '../model/CategoryModel.dart';
import "../service/service_methd.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import 'package:provider/provider.dart';
import '../provider/category_provider.dart';

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
                CategoryGoodsList(),
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
      // print(value);
      // CategoryModels categoryModels = CategoryModels.fromJson(value);
      List<CategoryModel> categoryModels =
          CategoryModel.fromJsonList(value["data"]);
      // print(categoryModels.data);
      setState(() {
        // list = categoryModels.data;
        list = categoryModels;
      });

      context.read<CategoryProvider>().setChildren(list[0].children);
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

        context.read<CategoryProvider>().setChildren(list[index].children);
      },
      child: Container(
        height: ScreenUtil().setHeight(44),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: index == clickIndex ? Colors.black12 : Colors.white,
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

class _RightCategoryNavState extends State<RightCategoryNav> {
  // List list = ['贵州茅台', '五粮液', '汾酒', '洋河', '北京二锅头', '青梅酒', '古井贡酒', '拉菲'];

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
        itemCount: context.watch<CategoryProvider>().categoryChildren.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        },
      ),
    );
  }

  Widget buildItem(int index) {
    CategoryChildModel model =
        context.watch<CategoryProvider>().categoryChildren[index];

    return InkWell(
      onTap: () {
        context.read<CategoryProvider>().childIsSelected(index);
      },
      child: Container(
        // color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          model.name,
          style: TextStyle(
            color: model.isSelected == true ? Colors.red : Colors.black26,
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Selector<CategoryProvider, CategoryProvider>(
  //     shouldRebuild: (previous, next) => false,
  //     selector: (_, provider) => provider,
  //     builder: (_, provider, child) {
  //       return Container(
  //         height: ScreenUtil().setHeight(44),
  //         width: ScreenUtil().setWidth(314),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border: Border(
  //             bottom: BorderSide(
  //               width: 1,
  //               color: Colors.black12,
  //             ),
  //           ),
  //         ),
  //         child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: provider.categoryChildren.length,
  //           itemBuilder: (_, index) => Selector(
  //             selector: (_, CategoryProvider provider) =>
  //                 provider.categoryChildren[index],
  //             builder:
  //                 (_, CategoryChildModel categoryChildModel, Widget child) {
  //               return InkWell(
  //                 onTap: () {
  //                   context.read<CategoryProvider>().childIsSelected(index);
  //                 },
  //                 child: Container(
  //                   // color: Colors.red,
  //                   alignment: Alignment.centerLeft,
  //                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                   child: Text(
  //                     categoryChildModel.name,
  //                     style: TextStyle(
  //                       color: categoryChildModel.isSelected == true
  //                           ? Colors.red
  //                           : Colors.black26,
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List<HotGoodsModel> list = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    getRequest("hotGoods").then((value) {
      List<HotGoodsModel> models = HotGoodsModel.fromJsonList(value);
      print({'models': HotGoodsModel.toJsonList(models)});
      setState(() {
        list = models;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(314),
        color: Colors.cyan,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => buildItem(index),
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Row(
          children: [
            Image.network(
              list[index].url,
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(100),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text(
                      list[index].title,
                      style: TextStyle(
                        backgroundColor: Colors.red,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "¥" + list[index].price.toString(),
                          style: TextStyle(color: Colors.orange),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "¥" + list[index].marketprice.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
