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
  List<Map> hotGoods = [];

  @override
  void initState() {
    super.initState();

    // getHomeData().then((value) {
    //   setState(() {
    //     print({'initState重新加载首页': value});
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天上人间'),
      ),
      backgroundColor: Colors.amberAccent,
      body: FutureBuilder(
        future: getHomeData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var data = json.decode(snapshot.data.toString());
            // print(data);
            List<Map> swiper =
                (snapshot.data['swipers'] as List).cast(); //强制转换为list
            List navigatorList = snapshot.data['navigatorList'];
            String adpicture = snapshot.data['adpicture'];
            Map leader = snapshot.data["kefu"];
            List goods = snapshot.data["goods"];
            Map floor = snapshot.data["floor"];

            // print({'leader': leader['url'].toString()});

            // EasyRefresh(
            //   child: ScrollView(),
            // )

            return EasyRefresh(
              header: PhoenixHeader(), //头部刷新
              footer: TaurusFooter(),
              // header: MaterialHeader(),
              // footer: MaterialFooter(),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SwiperDiy(
                      swiperDataList: swiper,
                    ),
                    TopNavigator(
                      navigatorList: navigatorList,
                    ),
                    AdBanner(
                      adpicture: adpicture,
                    ),
                    LeaderPhone(
                      phone: leader["phone"].toString(),
                      url: leader["url"],
                    ),
                    Recomment(
                      goods: goods,
                    ),
                    FLoorGoods(
                      title: floor["title"],
                      goods: floor["list"],
                    ),
                    _getHotGoods()
                  ],
                ),
              ),
              onRefresh: () async {},
              onLoad: () async {
                await getRequest("hotGoods",
                        queryParameters: {"_page": page, "_limit": 6})
                    .then((value) {
                  print((value as List).cast());
                  setState(() {
                    page++;
                    hotGoods.addAll((value as List).cast());
                  });
                });
              },
            );
          } else {
            return Center(
              child: Text(
                '加载中...' + homePageContent,
                overflow: TextOverflow.fade,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getHotGoods() {
    return Container(
      child: Column(
        children: [_hotTitle, _hotGoods()],
      ),
    );
  }

  Widget _hotTitle = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      color: Colors.transparent,
      child: Text(
        "火爆专区",
        style: TextStyle(
          color: Colors.purple,
          fontSize: ScreenUtil().setSp(16),
        ),
      ));

  Widget _hotGoods() {
    if (hotGoods.length == 0) {
      return Text('');
    }

    List<Widget> hotGoodsWidget = hotGoods.map((e) {
      return InkWell(
          child: Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(300),
              padding: EdgeInsets.all(5.0),
              // margin: EdgeInsets.only(bottom: 3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      e['url'],
                      width: ScreenUtil().setWidth(200),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      e['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('¥' + e['price'].toString()),
                        Text(
                          '¥' + e["marketprice"].toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ])));
    }).toList();

    return Wrap(
      children: hotGoodsWidget,
      spacing: 3,
      runSpacing: 5,
      // runAlignment: WrapAlignment.spaceAround,
      // verticalDirection: VerticalDirection.down,
      alignment: WrapAlignment.start,
    );
  }
}

/** 首页轮播图 */
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    // print({
    //   'defaultSize': ScreenUtil.defaultSize,
    //   'pixelRatio': ScreenUtil().pixelRatio,
    //   'screenWidth': ScreenUtil().screenWidth,
    //   'screenHeight': ScreenUtil().screenHeight,
    //   'bottomBarHeight': ScreenUtil().bottomBarHeight,
    //   'textScaleFactor': ScreenUtil().textScaleFactor,
    //   'scaleWidth': ScreenUtil().scaleWidth,
    //   'scaleHeight': ScreenUtil().scaleHeight,
    //   '屏幕宽度的0.2倍': 0.2,
    // });

    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().screenWidth,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${swiperDataList[index]['url']}",
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

/**中部菜单 */
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print(item);
      },
      child: Column(
        children: [
          Image.network(
            item['imageUrl'],
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(40),
            fit: BoxFit.cover,
          ),
          Text(item['title']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(160),
      color: Colors.white,
      padding: EdgeInsets.all(3),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children:
            navigatorList.map((e) => _gridViewItemUI(context, e)).toList(),
      ),
    );
  }
}

/**广告区域 */
class AdBanner extends StatelessWidget {
  final String adpicture;
  const AdBanner({Key key, this.adpicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Image.network(
          adpicture,
          height: ScreenUtil().setHeight(180),
          width: ScreenUtil().screenWidth,
          fit: BoxFit.cover,
        ));
  }
}

/**店长电话 */
class LeaderPhone extends StatelessWidget {
  final String phone;
  final String url;
  const LeaderPhone({Key key, this.phone, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(
          url,
          // width: ScreenUtil().screenWidth,
          // height: ScreenUtil().setHeight(180),
          // fit: BoxFit.fill,
        ),
      ),
    );
  }

  void _launchURL() async {
    if (await canLaunch(phone)) {
      await launch('tel:' + phone);
    } else {
      throw "url不能访问:模拟器不能拨打电话";
    }

    // const url = 'https://www.baidu.com';
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

/**商品区域 */
class Recomment extends StatelessWidget {
  final List goods;
  const Recomment({Key key, this.goods}) : super(key: key);

  Widget _header() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      height: ScreenUtil().setHeight(40),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.green))),
      child: Text("商品活动",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(16), color: Colors.black38)),
    );
  }

  Widget _item(context, index) {
    var item = InkWell(
      onTap: () => {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text(goods[index]['title']),
        //   ),
        // )

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(goods[index]['title'])))
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(120),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(width: 1, color: Colors.green),
                bottom: BorderSide(width: 1, color: Colors.green))),
        child: Column(
          children: [
            Image.network(
              goods[index]["url"],
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(100),
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¥${goods[index]["price"]}',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                ),
                Text("¥${goods[index]["hotprice"]}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ))
              ],
            )
          ],
        ),
      ),
    );

    return Tooltip(
      message: goods[index]['title'],
      child: item,
    );
  }

  Widget _listView() {
    return Container(
      height: ScreenUtil().setHeight(100),
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) => _item(context, index),
        itemCount: goods.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(140),
      width: ScreenUtil().screenWidth,
      child: Column(
        children: [_header(), _listView()],
      ),
    );
  }
}

/**楼层商品 */
class FLoorGoods extends StatelessWidget {
  final String title;
  final List goods;
  const FLoorGoods({Key key, this.title, this.goods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_header(), _floor1(), _floor2()],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(title),
    );
  }

  Widget _floor1() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 4, 8),
            width: ScreenUtil().screenWidth / 2,
            height: ScreenUtil().setHeight(300),
            child: Image.network(
              goods[0]['url'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            InkWell(
                child: Container(
              width: ScreenUtil().screenWidth / 2,
              height: ScreenUtil().setHeight(150),
              padding: EdgeInsets.fromLTRB(4, 0, 8, 4),
              child: Image.network(
                goods[1]['url'],
                fit: BoxFit.cover,
              ),
            )),
            InkWell(
              child: Container(
                width: ScreenUtil().screenWidth / 2,
                height: ScreenUtil().setHeight(150),
                padding: EdgeInsets.fromLTRB(4, 4, 8, 8),
                child: Image.network(
                  goods[2]['url'],
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _floor2() {
    return Row(
      children: [
        Container(
          width: ScreenUtil().screenWidth / 2,
          height: ScreenUtil().setHeight(150),
          padding: EdgeInsets.fromLTRB(8, 0, 4, 8),
          child: InkWell(
            child: Image.network(goods[3]['url'], fit: BoxFit.cover),
          ),
        ),
        Container(
          width: ScreenUtil().screenWidth / 2,
          height: ScreenUtil().setHeight(150),
          padding: EdgeInsets.fromLTRB(4, 0, 8, 8),
          child: InkWell(
            child: Image.network(
              goods[4]['url'],
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
