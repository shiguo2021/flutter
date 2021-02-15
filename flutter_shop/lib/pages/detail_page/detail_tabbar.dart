import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";

class DetailTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodsDetailProvider provider = Provider.of<GoodsDetailProvider>(context);
    return Container(
        color: Colors.white,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setHeight(44),
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: ['详情', '评论'].asMap().entries.map((e) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  context.read<GoodsDetailProvider>().tabbarClickAt(e.key);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: provider.tabbarSelectedAt == e.key
                            ? Colors.pink
                            : Colors.black26,
                      ),
                    ),
                  ),
                  child: Text(
                    e.value,
                    style: TextStyle(
                      color: provider.tabbarSelectedAt == e.key
                          ? Colors.red
                          : Colors.black45,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
