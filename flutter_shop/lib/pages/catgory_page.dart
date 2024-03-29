import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/CategoryModel.dart';
import "../service/service_methd.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import 'package:provider/provider.dart';
import '../provider/category_provider.dart';

import 'package:fluttertoast/fluttertoast.dart';

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
        child: FutureProvider<List<CategoryModel>>(
          initialData: [],
          create: (context) =>
              context.read<CategoryProvider>().fetchCategorys(),
          child: Consumer<List<CategoryModel>>(
            builder: (context, value, child) {
              // print({'value', value});
              // Provider.of<CategoryProvider>(context).initData(value);

              return value.length == 0
                  ? Center(
                      child: Text(
                        '正在加载数据...',
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        CategoryNavLeft(),
                        Column(
                          children: [
                            RightCategoryNav(),
                            CategoryGoodsList(),
                          ],
                        ),
                      ],
                    );
            },
          ),
        ),

        // child: Row(
        //   children: [
        //     CategoryNavLeft(),
        //     Column(
        //       children: [
        //         RightCategoryNav(),
        //         CategoryGoodsList(),
        //       ],
        //     ),
        //   ],
        // ),
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
  // List<CategoryModel> list = [];
  // int clickIndex = 0;
  @override
  void initState() {
    // loadData();
    super.initState();
  }

  void loadData() {
    getRequest('categorys').then((value) {
      // print(value);
      // CategoryModels categoryModels = CategoryModels.fromJson(value);
      List<CategoryModel> categoryModels =
          CategoryModel.listFromJson(value["data"]);

      context.read<CategoryProvider>().initData(categoryModels);

      // setState(() {
      //   // list = categoryModels.data;
      //   list = categoryModels;
      // });

      // context.read<CategoryProvider>().categoryClickAt();
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
        itemCount: context.watch<CategoryProvider>().categorys.length,
      ),
    );
  }

  Widget buildItem(int index) {
    CategoryModel categroyModel =
        context.watch<CategoryProvider>().categorys[index];

    return InkWell(
      onTap: () {
        context.read<CategoryProvider>().categoryClickAt(index);
      },
      child: Container(
        height: ScreenUtil().setHeight(44),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color:
              categroyModel.isSelected == true ? Colors.black12 : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(
          context.watch<CategoryProvider>().categorys[index].name,
          // list[index].name,
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
        itemCount: context.watch<CategoryProvider>().categoryChilds.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        },
      ),
    );
  }

  Widget buildItem(int index) {
    CategoryChildModel model =
        context.watch<CategoryProvider>().categoryChilds[index];

    return InkWell(
      onTap: () {
        context.read<CategoryProvider>().categoryChildClickAt(index);
      },
      child: Container(
        // color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        // child: Text(
        //   model.name,
        //   style: TextStyle(
        //     color: model.isSelected == true ? Colors.red : Colors.black26,
        //   ),
        // ),

        /// Selector的用法
        child: Selector<CategoryProvider, CategoryChildModel>(
          selector: (_, provider) => provider.categoryChilds[index],
          builder: (_, value, child) {
            return Text(
              value.name,
              style: TextStyle(
                color: value.isSelected == true ? Colors.red : Colors.black26,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  // List<HotGoodsModel> list = [];

  var _controller = ScrollController();

  @override
  void initState() {
    // loadData();
    super.initState();
  }

  // void loadData() {
  //   getRequest("hotGoods").then((value) {
  //     List<HotGoodsModel> models = HotGoodsModel.listFromJson(value);
  //     // print({'models': HotGoodsModel.listToJson(models)});
  //     setState(() {
  //       list = models;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //滚回到顶部
    // _controller.jumpTo(0.0);

    print('10s后滚回到顶部');
    Future.delayed(Duration(seconds: 10), () {
      _controller.jumpTo(0.0);
    });

    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(314),
        color: Colors.cyan,
        child: ListView.builder(
          controller: _controller,
          itemCount: context.watch<CategoryProvider>().hotGoods.length,
          itemBuilder: (_, index) => buildItem(index),
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
          msg: "5秒以后滚动到顶部",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
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
              context.watch<CategoryProvider>().hotGoods[index].url,
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
                      context.watch<CategoryProvider>().hotGoods[index].title,
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
                          "¥" +
                              context
                                  .watch<CategoryProvider>()
                                  .hotGoods[index]
                                  .price
                                  .toString(),
                          style: TextStyle(color: Colors.orange),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "¥" +
                                context
                                    .watch<CategoryProvider>()
                                    .hotGoods[index]
                                    .marketprice
                                    .toString(),
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
