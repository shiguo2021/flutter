import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";

import './detail_page/detail_top_area.dart';
import './detail_page/detail_explain.dart';
import './detail_page/detail_tabbar.dart';
import './detail_page/detail_web.dart';
import './detail_page/detail_bottom.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String title;

  DetailPage({
    this.id,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.redAccent)),
        backgroundColor: Color.fromRGBO(112, 68, 65, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.black12,
        // padding: EdgeInsets.only(bottom: 100),
        // height: double.infinity,
        child: FutureBuilder(
          future: context.read<GoodsDetailProvider>().loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  ListView(
                    children: [
                      DetailTopArea(),
                      DetailExplain(),
                      DetailTabbar(),
                      DetailWeb(),
                    ],
                  ),
                  Positioned(
                    child: DetailBottom(),
                    bottom: 0,
                    left: 0,
                  )
                ],
              );

              // return SingleChildScrollView(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       DetailTopArea(),
              //       DetailExplain(),
              //     ],
              //   ),
              // );
            }

            return Center(
              child: Text('正在加载数据...'),
            );
          },
        ),
      ),
    );
  }
}
