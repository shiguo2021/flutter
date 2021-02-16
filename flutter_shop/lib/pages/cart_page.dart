import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:shared_preferences/shared_preferences.dart";

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList = [];

  @override
  void initState() {
    _show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 500,
            color: Colors.yellow,
            child: ListView.builder(
              itemCount: testList.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(testList[index]),
              ),
            ),
          ),
          RaisedButton(
            onPressed: _add,
            child: Text('增加'),
          ),
          RaisedButton(
            onPressed: _remove,
            child: Text('清除一个'),
          ),
          InkWell(
            onTap: _clear,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(width: 1, color: Colors.green),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red[200],
                      offset: Offset(2.0, 2.0), //阴影xy轴偏移量
                      blurRadius: 2.0, //阴影模糊程度
                      spreadRadius: 2.0 //阴影扩散程度
                      )
                ],
              ),
              child: Text('清除所有'),
            ),
          )
        ],
      ),
    );
  }

  _add() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    testList.add('js胖最胖' + Random().nextInt(10000).toString());
    sp.setStringList('testList', testList);

    _show();
  }

  _show() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getStringList('testList') != null) {
      setState(() {
        testList = sp.getStringList("testList");
      });
    } else {
      setState(() {
        testList = [];
      });
    }
  }

  _remove() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('testList');
    _show();
  }

  _clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    _show();
  }
}
