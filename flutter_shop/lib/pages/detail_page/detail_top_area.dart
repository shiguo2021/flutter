import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";

class DetailTopArea extends StatelessWidget {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getImage(),
          _title(),
          _no(),
          _prices(),
        ],
      ),
    );
  }

  Widget _getImage() {
    return Image.network(
      _context.read<GoodsDetailProvider>().detailModel.goodsUrl,
      width: ScreenUtil().screenWidth - 20,
      height: ScreenUtil().setHeight(500),
      fit: BoxFit.contain,
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        _context.watch<GoodsDetailProvider>().detailModel.goodsName,
        maxLines: 2,
        style: TextStyle(
          color: Colors.black87,
          fontSize: ScreenUtil().setSp(18),
        ),
      ),
    );
  }

  Widget _no() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        '编号:' + _context.watch<GoodsDetailProvider>().detailModel.NO,
        maxLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(14),
        ),
      ),
    );
  }

  Widget _prices() {
    return Row(
      children: [
        Text(
          '¥${_context.read<GoodsDetailProvider>().detailModel.price.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: ScreenUtil().setSp(24),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
        ),
        Row(
          children: [
            Text(
              '市场价',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
            ),
            Text(
              '¥${_context.read<GoodsDetailProvider>().detailModel.marketprice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.black38,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        )
      ],
    );
  }
}
