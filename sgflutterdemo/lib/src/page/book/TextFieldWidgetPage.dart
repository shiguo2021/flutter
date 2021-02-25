import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class TextFieldWidgetPage extends StatelessWidget {
  String title;
  TextFieldWidgetPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerLeft,
              child: Text('点击事件'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.orangeAccent,
          child: Column(
            children: [
              TextFieldExample1(),
              Divider(),
              TextFieldExample2(),
              Divider(),
              TextFieldExample3(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      maxLength: 11,
      keyboardType: TextInputType.datetime,
      //  keyboardType: TextInputType.number,
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
      onChanged: (val) => print(val),
    );
  }
}

class TextFieldExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) => print(val),
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
    );
  }
}

class TextFieldExample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      margin: EdgeInsets.all(10),
      child: TextField(
        onChanged: (val) => print(val),
        decoration: InputDecoration(
          labelText: '悬浮提示，可代替hintText',
          hintText: '输入提示',
          // errorText: '错误提示',
          helperText: '帮助文字',
          //内填充
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.red,
          //边框
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          //左侧Icon
          prefixIcon: Icon(CupertinoIcons.lock),
          prefixText: '左内文字',
          suffixIcon: IconButton(
              icon: Icon(CupertinoIcons.delete_simple),
              onPressed: () {
                print('delete');
              }),
          suffixText: '右内文字',
        ),
        //右侧Icon
      ),
    );
  }
}
