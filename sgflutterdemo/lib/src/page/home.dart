import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: InputView(),
        automaticallyImplyLeading: false, //隐藏返回键
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Color(0xFFf5f5f5),
        child: ListView(
          children: [
            SwpierView(),
            Menu(),
          ],
        ),
      ),
    );
  }
}

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0.2), //阴影xy轴偏移量
              blurRadius: 1, //阴影模糊程度
              spreadRadius: 1 //阴影扩散程度
              )
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(44),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "2021新的起点...",
            // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.circular(2),
            ),
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            prefixIcon: InkWell(
                onTap: () {
                  print(1);
                },
                child: Container(
                    width: 50,
                    margin: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    child: Text('武汉',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16))))),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class SwpierView extends StatelessWidget {
  Future<List> getSwipers(BuildContext context) {
    final swipers = DefaultAssetBundle.of(context)
        .loadString('lib/src/data/home.json')
        .then((res) {
      return (json.decode(res)['swipers'] as List);
    });
    return swipers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSwipers(context),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            List dataList = snapshot.data as List;
            return Container(
              height: ScreenUtil().setHeight(180),
              width: ScreenUtil().screenWidth,
              // color: Colors.black,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    // "http://via.placeholder.com/288x188",
                    dataList[index]['url'],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: dataList.length,
                fade: 0.3,
                viewportFraction: 0.7,
                scale: 0.9,
                outer: true,
                autoplay: true,
                pagination: new SwiperPagination(
                  margin: EdgeInsets.zero,
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: 8,
                      activeSize: 10,
                    ).build(context, config);
                  }),
                ),
              ),
            );
          }

          return Container(
            color: Colors.red,
          );
        });
  }
}

class Menu extends StatelessWidget {
  Future<List> getMenues(BuildContext context) async {
    String home = await DefaultAssetBundle.of(context)
        .loadString('lib/src/data/home.json');
    return json.decode(home)['menu'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder(
        future: getMenues(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List dataList = snapshot.data;
            final screen_width = MediaQuery.of(context).size.width;
            final w = (screen_width - 20) / 4;
            return Wrap(
              // spacing: 10,
              runSpacing: 10,
              children: dataList.map((e) {
                return InkWell(
                  onTap: () {
                    print({
                      'e': e,
                      'is': e['page'],
                    });
                    if (e['page'] is String) {
                      Application.router.navigateTo(context,
                          '${e['page']}_widget?title=${Uri.encodeComponent(e['title'])}');
                    }
                  },
                  child: Container(
                    width: w,
                    height: ScreenUtil().setHeight(60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Placeholder(),
                        )),
                        SizedBox(height: 4),
                        Text(e['title'],
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: ScreenUtil().setSp(13))),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }

          return Container();
        },
      ),
    );
  }
}
