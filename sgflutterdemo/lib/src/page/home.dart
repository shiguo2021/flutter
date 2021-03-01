import 'package:flutter/material.dart';
import '../index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: [
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    /**顶部输入框 */
                    InputView()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(44),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "flutter知识要点",
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            prefixIcon: InkWell(
              child: Text('123', style: TextStyle(color: Colors.red)),
            ),
            // prefixIcon: InkWell(
            //     child: Text('搜索',
            //         style: TextStyle(
            //             height: ScreenUtil().setHeight(44),
            //             color: Colors.blueAccent,
            //             backgroundColor: Colors.red,
            //             fontSize: ScreenUtil().setSp(14)))),
          ),
        ),
      ),
    );
  }
}
