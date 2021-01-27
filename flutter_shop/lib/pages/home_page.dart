import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_methd.dart';
import 'dart:convert';

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

    getHomeSwiper().then((value) {
      setState(() {
        // homePageContent = value.toString();
        homePageContent = value['data']['data'][0]['title'];
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
          future: getHomeSwiper(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // var data = json.decode(snapshot.data.toString());
              // print(data);
              List<Map> swiper = (snapshot.data['data']['data'] as List).cast();

              return Column(
                children: <Widget>[
                  SwiperDiy(
                    swiperDataList: swiper,
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
    return Container(
      height: 333,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['advertiseImg']}");
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
