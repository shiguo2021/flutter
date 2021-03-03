import 'package:flutter/material.dart';
import '../../index.dart';

class CustomScrollView_widget extends StatelessWidget {
  String title;
  CustomScrollView_widget({this.title});
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      print(_controller.offset);
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: Container(
        color: Theme.of(context).primaryColorLight,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              // iconTheme: IconThemeData(
              //   color: Colors.red, //修改颜色
              // ),
              forceElevated: false, //是否显示阴影
              floating:
                  true, //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
              snap:
                  true, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
              pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
              leading: new IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.yellow),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: <Widget>[
                new IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print("添加");
                  },
                ),
                new IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    print("更多");
                  },
                ),
              ],
              expandedHeight: 230.0,
              //滑动标题上移效果
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  title,
                ),
                centerTitle: true,
                // collapseMode: CollapseMode.pin,
                background: Image.network(
                  'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: List.generate(8, (index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              }).toList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // return Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: List(10).asMap().keys.map((e) {
                  //     return Text('$index--${e}',
                  //         style: TextStyle(backgroundColor: Colors.red));
                  //   }).toList(),
                  // );

                  return Text('$index',
                      style: TextStyle(backgroundColor: Colors.red));
                },
                childCount: 5,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // return Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: List(10).asMap().keys.map((e) {
                  //     return Text('$index--${e}',
                  //         style: TextStyle(backgroundColor: Colors.red));
                  //   }).toList(),
                  // );

                  return Text('section-$index',
                      style: TextStyle(backgroundColor: Colors.red));
                },
                childCount: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
