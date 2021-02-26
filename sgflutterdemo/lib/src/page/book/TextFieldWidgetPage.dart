import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class TextFieldWidgetPage extends StatelessWidget {
  String title;
  TextEditingController controller = TextEditingController(text: '测试Example4');
  FocusNode focusNode = FocusNode();
  TextFieldWidgetPage({this.title});
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print(controller.text);
    });

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          InkWell(
            onTap: () {
              print({'text': controller.text});
              FocusScope.of(context).requestFocus(focusNode);
            },
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerLeft,
              child: Text('点击事件'),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Column(
          children: [
            Expanded(
              child: CupertinoScrollbar(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FocusExample(),
                      Divider(),
                      Example1(),
                      Divider(),
                      Example2(),
                      Divider(),
                      Example3(),
                      Divider(),
                      Example4(controller: controller, focusNode: focusNode),
                      Divider(),
                      Exmaple5(),
                      Divider(),
                      Example6(),
                      Divider(),
                      Example7(),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('点击事件'),
            )
          ],
        ),
      ),
    );
  }
}

class Example1 extends StatelessWidget {
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
          hintText: "请输入您的手机号Example1",
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

class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) => print(val),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 15),
          labelText: "密码",
          hintText: "请输入您的登录密码Example2",
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

class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      margin: EdgeInsets.all(10),
      child: TextField(
        onChanged: (val) => print(val),
        decoration: InputDecoration(
          labelText: '悬浮提示，可代替hintText',
          hintText: '输入提示Example3',
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

class Example4 extends StatelessWidget {
  TextEditingController controller;
  FocusNode focusNode;
  Example4({this.controller, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.yellow,
      child: Column(
        children: [
          TextField(
            focusNode: focusNode,
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: '请输入你的手机号码Example4',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  controller.text = '';
                },
              ),
            ),
          ),
          Divider(color: Colors.red)
        ],
      ),
    );
  }
}

class Exmaple5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 40,
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 15),
          labelText: "搜索Exmaple5",
          labelStyle: TextStyle(color: Colors.red),
          fillColor: Color(0XFFFFF8F4),
          filled: true,
          enabledBorder: OutlineInputBorder(
            /*边角*/
            borderRadius: BorderRadius.all(
              Radius.circular(5), //边角为5
            ),
            borderSide: BorderSide(
              color: Colors.green, //边线颜色为白色
              width: 1, //边线宽度为2
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red, //边框颜色为白色
              width: 1, //宽度为5
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5), //边角为30
            ),
          ),
        ),
      ),
    );
  }
}

class Example6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250,
        minWidth: 200,
      ),
      child: TextField(
        autofocus: true,
        maxLength: 11,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
            // labelText: "用户名",
            hintText: "用户名或邮箱Example6",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
            ),
            filled: true,
            fillColor: Color(0xffDCDCDC),
            prefixIcon: Icon(Icons.person)),
        onChanged: (val) {},
      ),
    );
  }
}

class FocusExample extends StatefulWidget {
  @override
  _FocusExampleState createState() => new _FocusExampleState();
}

class _FocusExampleState extends State<FocusExample> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(labelText: "input1FocusExample"),
          ),
          TextField(
            focusNode: focusNode2, //关联focusNode2
            decoration: InputDecoration(labelText: "input2FocusExample"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class Example7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "请输入用户名Example7",
        prefixIcon: Icon(Icons.person),
        // 未获得焦点下划线设为灰色
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        //获得焦点下划线设为蓝色
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
