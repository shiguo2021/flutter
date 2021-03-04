import 'package:flutter/material.dart';
import 'package:sgflutterdemo/src/widgets/index.dart';
import '../index.dart';
import 'package:provider/provider.dart';
import '../provider/AppModel.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFf5f5f5),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    // padding: EdgeInsets.symmetric(vertical: 30),
                    height: ScreenUtil().screenHeight * 0.3,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20191226%2Fdcdd724d003145f3b074418bbbc187be.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617201806&t=1ee7d1e5f2f8a716d4adb535a1469f2f'),
                                      radius: ScreenUtil().setHeight(32)),
                                  SizedBox(width: 10),
                                  Text('平平无奇吃饭小天才',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(18),
                                          color: Colors.white))
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('foward');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomCell(
                      title: "版本信息", content: "v1.0.0", icon: Icons.info),
                  CustomCell(title: "关于我们", icon: Icons.person),
                  LogoutButton(),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  print('to setting');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AppModel>().initModel();
        Application.router.navigateTo(context, 'login');
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        height: ScreenUtil().setHeight(44),
        alignment: Alignment.center,
        child: Text('退出登录', style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
