import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";
import "package:flutter_html/flutter_html.dart";

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodsDetailProvider provider = Provider.of<GoodsDetailProvider>(context);
    return Container(
      color: Colors.white,
      // width: ScreenUtil().screenWidth,
      // margin: EdgeInsets.only(top: 10),
      child: Consumer<GoodsDetailProvider>(
        builder: (_, provider, child) {
          return provider.tabbarSelectedAt == 0
              ? _html()
              : Container(
                  height: 300,
                  child: Center(
                    child: Text('暂无数据'),
                  ),
                );
        },
      ),
    );
  }

  Widget _html() {
    return Html(
      data: """<div>
        <h1>白酒详情</h1>
        <p>This is a fantastic product that you should buy!</p>
        <h3>Features</h3>
        <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
        <!--You can pretty much put any html in here!-->
        <p>
   Linking to <a href='https://github.com'>websites</a> has never been easier.
  </p>
  <img alt='Alt Text of an intentionally broken image' src='https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2156594670,951814631&fm=26&gp=0.jpg'/>
  <span>纯粮食酒</span>
  <img src='https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1387241835,3053046937&fm=26&gp=0.jpg'/>
  <img src='https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jiushui.tv%2Fproduct%2F2009%2F11-16%2F2009111614212361638.jpg&refer=http%3A%2F%2Fimg.jiushui.tv&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616036286&t=74d5d3f3d3e86e4bdb82b369380d401e'/>
      </div>""",
    );
  }
}
