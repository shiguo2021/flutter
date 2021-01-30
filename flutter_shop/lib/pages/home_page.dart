import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_methd.dart';
import 'dart:convert';
import 'package:flutter_screenutil/screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据...';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHomeData().then((value) {
      setState(() {
        // print(value.toString());
      });
    });
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
              List<Map> swiper = (snapshot.data['swipers'] as List).cast();
              List navigatorList = snapshot.data['navigatorList'];
              String adpicture = snapshot.data['adpicture'];
              return Column(
                children: <Widget>[
                  SwiperDiy(
                    swiperDataList: swiper,
                  ),
                  TopNavigator(
                    navigatorList: navigatorList,
                  ),
                  AdBanner(
                    adpicture: adpicture,
                  )
                ],
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
        ));
  }
}

/** 首页轮播图 */
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    print({
      'defaultSize': ScreenUtil.defaultSize,
      'pixelRatio': ScreenUtil().pixelRatio,
      'screenWidth': ScreenUtil().screenWidth,
      'screenHeight': ScreenUtil().screenHeight,
      'bottomBarHeight': ScreenUtil().bottomBarHeight,
      'textScaleFactor': ScreenUtil().textScaleFactor,
      'scaleWidth': ScreenUtil().scaleWidth,
      'scaleHeight': ScreenUtil().scaleHeight,
      '屏幕宽度的0.2倍': 0.2,
    });

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
      child: InkWell(
          child: Image.network(
        adpicture,
        height: ScreenUtil().setHeight(180),
        width: ScreenUtil().screenWidth,
        fit: BoxFit.cover,
      )),
    );
  }
}
