import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";
import "package:flutter_html/flutter_html.dart";

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(44),
      width: ScreenUtil().screenWidth,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(70),
              alignment: Alignment.center,
              child: Icon(Icons.shopping_cart, size: 35, color: Colors.red),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  '立即购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
