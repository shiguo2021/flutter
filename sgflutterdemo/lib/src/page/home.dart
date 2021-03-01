import 'package:flutter/material.dart';
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
        child: ListView(
          children: [
            Container(
              // color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  /**顶部输入框 */
                ],
              ),
            )
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
