import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/application.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        height: ScreenUtil().screenHeight,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
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
              Container(height: 20),
              Text('shiguo2021',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(32))),
              Container(height: 40),
              TextField(
                // autofocus: true,
                maxLength: 11,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    // labelText: "手机号",
                    hintText: "请输入您的手机号",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    prefixIcon: Icon(Icons.person)),
                onChanged: (val) {},
              ),
              Container(height: 20),
              TextField(
                style: TextStyle(),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    labelText: "密码",
                    hintText: "请输入您的登录密码",
                    // filled: true,
                    // fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      //borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                    ),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              Container(height: 40),
              RaisedButton(
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
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
