import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_methd.dart';
import 'dart:convert';
import 'package:flutter_screenutil/screenutil.dart';
import "package:url_launcher/url_launcher.dart";
import "package:flutter_easyrefresh/easy_refresh.dart";

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据...';

  int page = 1;
  List hotGoods = [];
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    // loadData();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('天上人间' + page.toString()),
        ),
        backgroundColor: Colors.amberAccent,
        body: EasyRefresh.custom(
          // header: PhoenixHeader(), //头部刷新
          // footer: TaurusFooter(),
          // header: MaterialHeader(),
          // footer: MaterialFooter(),

          // header: BallPulseHeader(),
          // footer: BallPulseFooter(),

          enableControlFinishRefresh: false,
          enableControlFinishLoad: false,
          header: ClassicalHeader(
            // infoText: '更多信息',
            refreshingText: '正在刷新',
            refreshedText: '刷新完成',
            refreshText: '下拉刷新',
            refreshReadyText: '准备刷新',
            noMoreText: '',
            textColor: Colors.pink,
            bgColor: Colors.white,
          ),
          footer: ClassicalFooter(
            // infoText: '更多信息',
            loadText: '上拉加载',
            loadingText: '正在加载',
            noMoreText: '没有更多文字',
            loadedText: '加载完毕',
            loadReadyText: '准备加载',
            textColor: Colors.pink,
            bgColor: Colors.white,
          ),

          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return listItemBuilder(context, index);
                },
                childCount: hotGoods.length,
              ),
            )
          ],
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              page = 1;
              loadData();
              // _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              page++;
              loadData();
            });
          },

          controller: _controller,
          emptyWidget: hotGoods.length == 0 ? _emptyViewWidget() : null,
        ));
  }

  Widget listItemBuilder(BuildContext context, int index) {
    return Container(
      width: ScreenUtil().screenWidth,
      child: Column(
        children: [
          Image.network(hotGoods[index]['url']),
          Text(hotGoods[index]['title']),
        ],
      ),
    );
  }

  void loadData() {
    getRequest("hotGoods", queryParameters: {"_page": page, "_limit": 6})
        .then((value) {
      // List datas = (value as List).cast();

      print(value);
      setState(() {
        if (page == 1) {
          hotGoods = value;
        } else {
          hotGoods.addAll(value);
        }
      });
    });
  }

  /// EmptyView组件
  Widget _emptyViewWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              _controller.callRefresh();
            },
            child: Image.network(
              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2396893094,1900056666&fm=26&gp=0.jpg',
              height: 150,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("没有更多数据,点击刷新")
        ],
      ),
    );
  }
}
