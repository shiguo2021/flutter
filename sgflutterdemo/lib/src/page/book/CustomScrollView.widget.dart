import 'package:flutter/material.dart';
import '../../index.dart';

class CustomScrollView_widget extends StatelessWidget {
  String title;
  CustomScrollView_widget({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: Container(
        color: Theme.of(context).primaryColorLight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.red, //修改颜色
              ),
              pinned: true,
              expandedHeight: 230.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(title),
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
                  // return Text('$index',
                  //     style: TextStyle(backgroundColor: Colors.red));

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List(10).asMap().keys.map((e) {
                      return Text('$index--${e}',
                          style: TextStyle(backgroundColor: Colors.red));
                    }).toList(),
                  );
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
