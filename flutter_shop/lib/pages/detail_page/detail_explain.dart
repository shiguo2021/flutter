import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";

class DetailExplain extends StatelessWidget {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().setHeight(44),
      padding: EdgeInsets.only(top: 10, left: 10),
      margin: EdgeInsets.only(top: 10),
      // alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '说明：> 极速送达 > 正品保证',
            style: TextStyle(
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
