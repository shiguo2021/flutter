import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/application.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class LoginPage extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.blueAccent,
        height: ScreenUtil().screenHeight,
        padding: EdgeInsets.all(20),
        child: KeyboardAvoider(
          autoScroll: true,
          child: ListView(
            controller: _controller,
            children: [
              Container(
                height: ScreenUtil().screenHeight * 0.2,
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: ScreenUtil().setWidth(30),
                      child: ClipOval(
                        child: Image.network(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=977863321,390860137&fm=15&gp=0.jpg',
                          fit: BoxFit.contain,
                        ),
                      )),
                  Container(width: 10),
                  Container(
                    width: ScreenUtil().setWidth(300),
                    child: Text(
                      'Flutter是Google一个新的用于构建跨平台的手机App的SDK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text('shiguo2021',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(32))),
              ),
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  // autofocus: true,
                  maxLength: 11,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    // labelText: "手机号",
                    hintText: "请输入您的手机号",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    prefixIcon: Icon(Icons.mobile_screen_share),
                    suffixIcon:
                        IconButton(icon: Icon(Icons.clear), onPressed: () {}),
                  ),

                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    // labelText: "密码",
                    hintText: "请输入您的登录密码",
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon:
                        IconButton(icon: Icon(Icons.clear), onPressed: () {}),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Application.router.navigateTo(context, 'tabs_bottom');
                  },
                  child: Container(
                    // width: ScreenUtil().setWidth(320),
                    width: double.maxFinite,
                    height: ScreenUtil().setHeight(44),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      '登录',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
