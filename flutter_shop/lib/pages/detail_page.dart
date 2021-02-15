import 'package:flutter/material.dart';
import "package:flutter_shop/provider/goods_detail_provider.dart";
import 'package:flutter_shop/model/GoodsDetailModel.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";

import './detail_page/detail_top_area.dart';
import './detail_page/detail_explain.dart';
import './detail_page/detail_tabbar.dart';

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
        title: Text(title, style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.tealAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
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
              return ListView(
                children: [
                  DetailTopArea(),
                  DetailExplain(),
                  DetailTabbar(),
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
